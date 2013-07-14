<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

 
// ------------------------------------------------------------------------

/**
 * Taxonomy Module 
 *
 * @package		ExpressionEngine
 * @subpackage	Addons
 * @category	Module
 * @author		Iain Urquhart
 * @link		http://iain.co.nz
 * @copyright 	Copyright (c) 2011 Iain Urquhart
 * @license   	Commercial, All Rights Reserved: http://devot-ee.com/add-ons/license/taxonomy/
 */

// ------------------------------------------------------------------------

class Taxonomy {
	
	public $return_data;
	
	/**
	 * Constructor
	 */
	public function __construct()
	{
		$this->EE =& get_instance();
		
		$this->EE->load->library('Ttree');
		
	}
	
	// ----------------------------------------------------------------

	/**
	 * exp:taxonomy:nav
	 *
	 * Generates a heirarchical list of nodes as an unordered list
	 *
	 */
	function nav($str = "")
	{
		
		$tree_id = $this->_get_tree_id();

		if ( ! $this->EE->ttree->check_tree_table_exists($tree_id))
			return false;

		$str = $this->EE->TMPL->tagdata;		
		$r = '';
		$tree_array = array();
		$options = array();
		$options['depth'] 			= (int) $this->_get_param('depth', 100);
		$options['display_root'] 	= $this->_get_param('display_root', 'yes');
		$options['root_lft'] 			= (int) $this->_get_param('root_node_lft', 1);
		$options['root_node_id'] 	= $this->_get_param('root_node_id');
		$options['root_node_entry_id'] 	= (int) $this->_get_param('root_node_entry_id');
		$options['ul_css_id'] 		= $this->_get_param('ul_css_id');
		$options['ul_css_class'] 	= $this->_get_param('ul_css_class');
		$options['hide_dt_group'] 	= $this->_get_param('hide_dt_group');
		$options['url_title']  		= $this->_get_param('url_title');
		$options['auto_expand']  	= $this->_get_param('auto_expand', 'no');
		$options['style']  			= $this->_get_param('style', 'nested');
		$options['path'] 			= NULL;
		$options['entry_status']  	= ( $this->_get_param('entry_status') ) ? explode('|', $this->_get_param('entry_status')) : array('open');
		$options['active_branch_start_level'] = (int) $this->_get_param('active_branch_start_level', 0);
		$options['node_active_class'] = $this->_get_param('node_active_class', 'active');
		$options['site_id']			= $this->_get_param('site_id', $this->EE->config->item('site_id'));
		$options['require_valid_entry_id']	= $this->_get_param('require_valid_entry_id', FALSE);
		$options['html_before']		= $this->_get_param('html_before', '');
		$options['html_after']		= $this->_get_param('html_after', '');
		$options['wrapper_ul']		= $this->_get_param('wrapper_ul', 'yes');
		$options['node_id'] 		= $this->_get_param('node_id', '');
		$options['exclude_node_id'] = ( $this->_get_param('exclude_node_id') ) ? explode('|', $this->_get_param('exclude_node_id')) : array();
		$options['exclude_entry_id'] = ( $this->_get_param('exclude_entry_id') ) ? explode('|', $this->_get_param('exclude_entry_id')) : array();
		$options['siblings_only'] 	= $this->_get_param('siblings_only', '');
		$options['timestamp'] = ($this->EE->TMPL->cache_timestamp != '') ? $this->EE->TMPL->cache_timestamp : $this->EE->localize->now;
		$options['show_future_entries'] 	= $this->_get_param('show_future_entries', 'no');
		$options['show_expired'] 	= $this->_get_param('show_expired', 'no');
		$options['template_path']  	= $this->_get_param('template_path', '');
		$options['use_custom_url'] 	= $this->_get_param('use_custom_url', 'no');
		$options['li_has_children_class'] = $this->_get_param('li_has_children_class', 'has_children');
		$options['disable_active_styles'] = $this->_get_param('disable_active_styles', 'no');
		
		//per-level parameters added by @_rsan
		foreach ($this->EE->TMPL->tagparams as $key => $value)
		{
			if (strncmp($key, 'ul_css_id:level_', 16) === 0)
			{
				$options[$key] = $value;
			}
			else if (strncmp($key, 'ul_css_class:level_', 19) === 0)
			{
				$options[$key] = $value;
			}
			else if (strncmp($key, 'li_css_class:level_', 19) === 0)
			{
				$options[$key] = $value;
			}
		}
		
		if($options['template_path'] != '')
		{
			$options['node_id'] = $this->EE->ttree->get_node_id_from_template_path($options['template_path']);
		}

		// fetch our current entry_id 
		if(
			$this->_get_param('entry_id') == '' 
			&& $options['node_id'] == '' 
			&& isset($this->EE->session->cache['taxonomy']['this_node']['entry_id'])
			&& $this->EE->session->cache['taxonomy']['this_node']['entry_id'] != ''
		  )
		{
			$options['entry_id'] = $this->EE->session->cache['taxonomy']['this_node']['entry_id'];
		}
		elseif(
			    $this->_get_param('entry_id') == '' 
			    && $options['node_id'] == '' 
			    && isset($this->EE->session->cache['taxonomy']['this_node']['node_id'])
			    && $this->EE->session->cache['taxonomy']['this_node']['node_id'] != ''
			  )
		{
			$options['node_id'] = $this->EE->session->cache['taxonomy']['this_node']['node_id'];
		}
		else
		{
			$options['entry_id'] = ( $this->_get_param('entry_id') != '{entry_id}' ) ? $this->_get_param('entry_id') : '';
		}
		
		/**
		 * @fccotech:  added this option to find a node based on it's custom url
		 * - an entry id overrides the custom url property
		*/
		if( $options['use_custom_url'] != 'no' && !$options['entry_id'])
		{                    
			$node_id = $this->EE->ttree->get_node_id_from_url_override();
			$node_uri = $this->EE->ttree->get_node_by_node_id($node_id, $tree_id);
	
			if($node_uri)
			{
			    $options['node_id']  = ($node_uri['node_id']) ? $node_uri['node_id'] : '';
			    $options['entry_id'] = ($node_uri['entry_id']) ? $node_uri['entry_id'] : '';
			}
		}

		$this->EE->TMPL->log_item("TAXONOMY:nav -> Fetched all params");
		
		if($options['url_title'])
		{
			$options['root_node_entry_id'] = $this->EE->ttree->get_entry_id_from_url_title($options['url_title']);
		}

		if($options['entry_id'] || $options['node_id'])
		{
			$here = ($options['entry_id']) ? 
								$this->EE->ttree->get_node_by_entry_id($options['entry_id'], $tree_id)
								: $this->EE->ttree->get_node_by_node_id($options['node_id'], $tree_id);			
			if($here)
			{
				$options['path'] = $this->EE->ttree->get_parents_crumbs($here['lft'],$here['rgt'],$tree_id);
			}
			// don't have a 'here' node, are we requiring the entry_id to exist in the tree?
			elseif($options['require_valid_entry_id'] == "yes")
			{
				return NULL;
			}			
		}
		
		// if we're just starting from the root, we just grab from our session array for performance.
		if(!$options['root_node_entry_id'] && !$options['root_node_id'] && isset($this->EE->session->cache['taxonomy']['tree'][$tree_id]['tree_array']))
		{
			$this->EE->TMPL->log_item("TAXONOMY:nav -> Tree Fetched from session cache");
			$tree_array = $this->EE->session->cache['taxonomy']['tree'][$tree_id]['tree_array'];
		}
		// we're grabbing a root node from further down the tree, or from another site just query it
		else
        {
        	$this->EE->TMPL->log_item("TAXONOMY:nav -> Tree Fetched from query");
        	$tree_array = $this->EE->ttree->tree_to_array($options['root_lft'], $options['root_node_entry_id'], $options['root_node_id']);
        }
		
		// active branch start level, accepts node_id or entry_id
		if(
			(($options['entry_id'] && $options['entry_id'] != "{entry_id}")
			|| $options['node_id'] != '')
			&& $options['active_branch_start_level'] > 0
		  )
		{

			$type = ($options['node_id'] != '') ? 'node_id' : 'entry_id';
			$id = ($options['node_id'] != '') ? $options['node_id'] : $options['entry_id'];
			
			$this->EE->TMPL->log_item("TAXONOMY:nav -> Post Processing Started");
			$items = array();
			$this->EE->ttree->flatten_tree($tree_array, $options['active_branch_start_level'], $items);
		
			foreach($items as $item)
			{
				if($this->EE->ttree->find_in_subset($item, $id, $options['depth'], $type))
				{
					$tree_array = array($item);
					break;
				}
				else
				{
					$tree_array = '';
				}
			}
			$this->EE->TMPL->log_item("TAXONOMY:nav -> Post Processing Finished");
		}

		$r = ($tree_array != array(0)) ? $this->EE->ttree->build_list($tree_array, $str, $options) : '';
		
		if($options['style'] == "nested")
		{
			// remove empty <ul>tags which are possible in some circumstances
			// bandaid @todo
			$pattern = "/<ul[^\/>]*>([\s]?)*<\/ul[^>]*>/"; 
			$r =  preg_replace($pattern, '', $r);
		}
		
		$r = ($r != '') ? $options['html_before'].$r.$options['html_after'] : ''; 

		// unset the node_count incase multiple trees are being output
		if (isset($this->EE->session->cache['taxonomy_node_count'])){$this->EE->session->cache['taxonomy_node_count'] = 1;}
		// ditto with prev level counter
		if (isset($this->EE->session->cache['taxonomy_node_previous_level'])){$this->EE->session->cache['taxonomy_node_previous_level'] = 0;}
		
		$this->EE->TMPL->log_item("TAXONOMY:nav -> Tree Rendered");
		
		return $r;
		
	}
	
	
	// ----------------------------------------------------------------
	
	
	/**
	 * exp:taxonomy:breadcrumbs
	 *
	 * Generates a breadcrumb trail from the current node with a specified entry_id
	 *
	 */
	function breadcrumbs()
	{
	
		$tree_id = $this->_get_tree_id();
				
		if ( ! $this->EE->ttree->check_tree_table_exists($tree_id))
			return false;
		
		$node_id = $this->_get_param('node_id');

		if($this->EE->TMPL->fetch_param('entry_id') == '' && $node_id == '' && isset($this->EE->session->cache['taxonomy']['this_node']['entry_id']))
		{
			$entry_id = $this->EE->session->cache['taxonomy']['this_node']['entry_id'];
		}
		else
		{
			$entry_id = ( $this->_get_param('entry_id') != '{entry_id}' ) ? $this->_get_param('entry_id') : '';
		}

		$return_data = '';
		
		$display_root = $this->EE->TMPL->fetch_param('display_root');
		$wrap_li 	= ($this->EE->TMPL->fetch_param('wrap_li') == 'yes') ? TRUE : FALSE;
		$delimiter = $this->_get_param('delimiter', ' &rarr; ');
		$include_here = $this->_get_param('include_here');
		$titles_only = $this->_get_param('titles_only');
		$reverse = $this->_get_param('reverse');
		$title_field = $this->_get_param('title_field', 'node_title');
		// remove the delimiter if we're wrapping in <li>
		
		if($wrap_li) $delimiter = NULL;
		
		$hide_dt_group 	= $this->_get_param('hide_dt_group', NULL);
		
		// no entry_id, assume node_id
		$here = ($entry_id != '') ? $this->EE->ttree->get_node_by_entry_id($entry_id) : $this->EE->ttree->get_node_by_node_id($node_id);
		
		// use a custom field for the 'here' node_title
		if($title_field != 'node_title')
		{
			$custom_fields = $this->unserialize($here['field_data']);
			$here['label'] = ( isset($custom_fields[$title_field]) ) ? $custom_fields[$title_field] : $here['label'];
		}

		if($here != '')
		{
			$path = $this->EE->ttree->get_parents_crumbs($here['lft'],$here['rgt']);
			
			if($reverse == 'yes')
			{
				if($display_root == "no" && isset($path[0]))
					unset($path[0]);
					
				$path = array_reverse($path);
				
				if($include_here != "no")
				{
					$return_data .= $here['label'].' '.$delimiter;
				}
			}
						
			$depth = 0;	
				
			foreach($path as $crumb)
			{
				// use a custom field for node_title
				if($title_field != 'node_title')
				{
					$custom_fields = $this->unserialize($crumb['field_data']);
					$crumb['label'] = ( isset($custom_fields[$title_field]) ) ? $custom_fields[$title_field] : $crumb['label'];
				}
				
	    		$template_group = ($crumb['is_site_default'] == 'y' && $hide_dt_group == "yes") ? '' : '/'.$crumb['group_name']; 
	    		
	    		// remove index from template names
				$template_name = ($crumb['template_name'] != 'index') ?	'/'.$crumb['template_name'] : ''; 
				$url_title = '/'.$crumb['url_title'];
				
				// build our node_url
				$node_url = $this->EE->functions->fetch_site_index();

				// override template and entry slug with custom url if set
				if($crumb['custom_url'] == "[page_uri]")
				{
	    			$site_id = $this->EE->config->item('site_id');
	    			$node_url = $this->EE->ttree->entry_id_to_page_uri($crumb['entry_id'], $site_id);
				}
				elseif($crumb['custom_url'] == "#")
    			{
    				$node_url = $data['custom_url'];
    			}
				elseif($crumb['custom_url'] != "")
				{
					// if its a relative link, add our site index
					$node_url = ((substr(ltrim($crumb['custom_url']), 0, 7) != 'http://') 
								&& 
								(substr(ltrim($crumb['custom_url']), 0, 8) != 'https://') 
								? $this->EE->functions->fetch_site_index() : '') . $crumb['custom_url'];
				}
				else
				{
					$node_url .= $template_group.$template_name.$url_title;
				}

				// get rid of double slashes, and trailing slash
				$node_url 	= rtrim($this->EE->functions->remove_double_slashes($node_url), '/');

				if($display_root =="no" && $depth == 0 && $reverse != "yes")
				{
					$return_data .= '';
				}
				elseif($titles_only == 'yes')
				{
					$return_data .= ' '.$crumb['label'].' '.$delimiter;
				}
				else
				{
					$return_data .= ($wrap_li) ? '<li>' : ' ';
					$return_data .= '<a href="'.$node_url.'">'.$crumb['label'].'</a> '.$delimiter;
					$return_data .= ($wrap_li) ? "</li>\n" : ' ';
				}
				
				$depth++;
				
			}
			
			if($include_here != 'no' && $reverse != "yes")
			{
				$return_data .= ($wrap_li) ? '<li>' : ' ';
				$return_data .= $here['label'];
				$return_data .= ($wrap_li) ? "</li>\n" : ' ';
			}
			else
			{
				// pop the last delimiter off
				$return_data = rtrim($return_data, $delimiter);
			}
			
		}	
	
		return $return_data;
	}
	
	// ----------------------------------------------------------------
	
	/**
	 * exp:taxonomy:node_url
	 * Returns the url of a node according to taxonomy by passing tree_id and entry_id
	 */
	function node_url()
	{
	
		$tree_id = $this->_get_tree_id();
				
		if ( !$this->EE->ttree->check_tree_table_exists($tree_id))
			return false;
		
		$entry_id = $this->_get_param('entry_id');
		$node_id = $this->_get_param('node_id');
		$relative = $this->_get_param('use_relative_path', '');
		
		$hide_dt_group = $this->_get_param('hide_dt_group');
		
		$return_data = '';
		$entries = array();
		$url_title = '';
		$template_group = '';
		$template = '';
		
		// stash node urls in the session array if they're not set
		if ( ! isset($this->EE->session->cache['taxonomy']['tree'][$tree_id]['entry_urls']))
		{
			$this->EE->ttree->stash_node_urls_array($tree_id, $hide_dt_group);
		}
				
		if($entry_id)
		{
			$url = ( isset($this->EE->session->cache['taxonomy']['tree'][$tree_id]['entry_urls']['entry_id:'.$entry_id]) ? 
						$this->EE->session->cache['taxonomy']['tree'][$tree_id]['entry_urls']['entry_id:'.$entry_id] : '');
		}
		elseif($node_id)
		{
			$url = ( isset($this->EE->session->cache['taxonomy']['tree'][$tree_id]['entry_urls']['node_id:'.$node_id]) ? 
						$this->EE->session->cache['taxonomy']['tree'][$tree_id]['entry_urls']['node_id:'.$node_id] : '');
		}

		if($relative)
		{
			$url =  str_replace( $this->EE->functions->fetch_site_index() , '' , $url);
		}

		return $url;
		
	}
	
	// ----------------------------------------------------------------
	
	
	function get_children_ids()
	{
		
		$tree_id = $this->_get_tree_id();
		
		if($this->EE->TMPL->fetch_param('entry_id') == ''&& isset($this->EE->session->cache['taxonomy']['this_node']['entry_id']))
		{
			$entry_id = $this->EE->session->cache['taxonomy']['this_node']['entry_id'];
		}
		else
		{
			$entry_id = ( $this->_get_param('entry_id') != '{entry_id}' ) ? $this->_get_param('entry_id') : '';
		}
		
		if ( ! $this->EE->ttree->check_tree_table_exists($tree_id) OR $entry_id == '')
			return false;
				
		$here = $this->EE->ttree->get_node_by_entry_id($entry_id);
		$immediate_children = array();
		$child_entry_ids = '';

		if($here != '')
		{
			$immediate_children = $this->EE->ttree->get_children_ids($here['node_id']);

			foreach($immediate_children as $child)
			{
				$child_entry_ids .= ($child['entry_id'] != 0) ? $child['entry_id'].'|' : '';
			}
		}

		return rtrim($child_entry_ids, '|');

	}
	
	// ----------------------------------------------------------------
	
	
	function get_sibling_ids()
	{
	
		$tree_id = $this->_get_param('tree_id');
		$entry_id = $this->_get_param('entry_id');
		$include_current = $this->_get_param('include_current');
		$return = '';

		if ( ! $this->EE->ttree->check_tree_table_exists($tree_id) OR $entry_id == '')
			return false;
		
		// where are we
		$here = $this->EE->ttree->get_node_by_entry_id($entry_id);
				
		// have we found the node, and it's not the root node
		if($here == "" OR $here['lft'] == '1')
		{
			return false;
		}
				
		$parent = $this->EE->ttree->get_parent($here['lft'],$here['rgt']);
		$siblings = $this->EE->ttree->get_children_ids($parent['node_id']);

		foreach($siblings as $sibling)
		{
			$return .= $sibling['entry_id'].'|';
		}
		
		// do we want the entry_id of the current node?
		if($include_current != 'yes')
		{
			$return = str_replace($here['entry_id'].'|', '', $return);
		}

		return rtrim($return, "|");
	
	}
	
	// ----------------------------------------------------------------
	
	/**
	 * exp:taxonomy:get_node
	 * Returns information about a requested node
	 */
	function get_node($tagdata = "")
	{
		
		$tree_id  	= (int) $this->_get_param('tree_id');
		$set_global  	= $this->_get_param('set_global', 'no');
		$key = $this->_get_param('key');
		$val 		= $this->_get_param('val');
		$var_prefix = $this->_get_param('var_prefix');
		$include_parent = $this->_get_param('include_parent');
		$store_vars = $this->_get_param('store_vars', 'yes');

		if ( ! $this->EE->ttree->check_tree_table_exists($tree_id))
			return false;
		
		// load our tree from cache if we've got it
		$tree_array = (isset($this->EE->session->cache['taxonomy']['tree'][$tree_id]['tree_array']))
						? $this->EE->session->cache['taxonomy']['tree'][$tree_id]['tree_array']
						 : $this->EE->ttree->tree_to_array(1);

		// search our tree and load our node from temp cache
		$this->EE->ttree->find_node($tree_array[0], $key, $val);
		
		$node = (isset($this->EE->session->cache['taxonomy']['temp_node'])) ? $this->EE->session->cache['taxonomy']['temp_node'] : array();
		
		if($set_global)
		{
			$this->EE->session->cache['taxonomy']['this_node']['tree_id'] 	= $tree_id;
			$this->EE->session->cache['taxonomy']['this_node']['entry_id'] 	= ( isset($node['entry_id']) ) ? $node['entry_id'] : '';
			$this->EE->session->cache['taxonomy']['this_node']['node_id'] 	= ( isset($node['node_id']) ) ? $node['node_id'] : '';
		}
		
		// not required again from here
		unset($this->EE->session->cache['taxonomy']['temp_node']);

		// fetch our tag_data
		$tagdata = $this->EE->TMPL->tagdata;
		
		$variables = array(
						$var_prefix.'tree_id' => $tree_id,
						$var_prefix.'node_id' => (isset($node['node_id'])) ? $node['node_id'] : '',
						$var_prefix.'node_lft' => (isset($node['lft'])) ? $node['lft'] : '',
						$var_prefix.'node_rgt' => (isset($node['rgt'])) ? $node['rgt'] : '',
						$var_prefix.'node_label' => (isset($node['label'])) ? $node['label'] : '',
						$var_prefix.'node_entry_id' => (isset($node['entry_id'])) ? $node['entry_id'] : '',
						$var_prefix.'node_template_id' => (isset($node['template_path'])) ? $node['template_path'] : '',
						$var_prefix.'node_field_data' => (isset($node['field_data'])) ? $node['field_data'] : '',
						$var_prefix.'node_status' => (isset($node['status'])) ? $node['status'] : '',
						$var_prefix.'node_highlight' => (isset($node['highlight'])) ? $node['highlight'] : '',
						$var_prefix.'node_title' => (isset($node['title'])) ? $node['title'] : '',
						$var_prefix.'node_url_title' => (isset($node['url_title'])) ? $node['url_title'] : '',
						$var_prefix.'node_entry_date' => (isset($node['entry_date'])) ? $node['entry_date'] : '',
						$var_prefix.'node_template_id' => (isset($node['template_id'])) ? $node['template_id'] : '',
						$var_prefix.'node_group_id' => (isset($node['group_id'])) ? $node['group_id'] : '',
						$var_prefix.'node_template_name' => (isset($node['template_name'])) ? $node['template_name'] : '',
						$var_prefix.'node_group_name' => (isset($node['group_name'])) ? $node['group_name'] : '',
						$var_prefix.'node_is_site_default' => (isset($node['is_site_default'])) ? $node['is_site_default'] : '',
						$var_prefix.'node_level' => (isset($node['level'])) ? $node['level'] : '',
						$var_prefix.'node_level+1' => (isset($node['level'])) ? $node['level']+1 : '',
						$var_prefix.'node_level+2' => (isset($node['level'])) ? $node['level']+2 : '',
						$var_prefix.'node_level-1' => (isset($node['level'])) ? $node['level']-1 : '',
						$var_prefix.'node_level-2' => (isset($node['level'])) ? $node['level']-2 : '',
						$var_prefix.'node_has_children' => (isset($node['has_children'])) ? $node['has_children'] : ''
					);
		
		// if we're requesting parent data too, lets get that
		if($include_parent && isset($node['lft']) && isset($node['rgt']))
		{
		 	
			$parent_node = $this->EE->ttree->get_parent($node['lft'], $node['rgt']);
		 	
		 	if($parent_node)
		 	{
			 	$this->EE->ttree->find_node($tree_array[0], 'lft', $parent_node['lft']);
				$parent_node = (isset($this->EE->session->cache['taxonomy']['temp_node'])) ? $this->EE->session->cache['taxonomy']['temp_node'] : '';
				unset($this->EE->session->cache['taxonomy']['temp_node']);
		 	}
		 	
			$variables += array(
				$var_prefix.'parent_node_id' => (isset($parent_node['node_id'])) ? $parent_node['node_id'] : '',
				$var_prefix.'parent_node_lft' => (isset($parent_node['lft'])) ? $parent_node['lft'] : '',
				$var_prefix.'parent_node_rgt' => (isset($parent_node['rgt'])) ? $parent_node['rgt'] : '',
				$var_prefix.'parent_node_label' => (isset($parent_node['label'])) ? $parent_node['label'] : '',
				$var_prefix.'parent_node_entry_id' => (isset($parent_node['entry_id'])) ? $parent_node['entry_id'] : '',
				$var_prefix.'parent_node_template_id' => (isset($parent_node['template_path'])) ? $parent_node['template_path'] : '',
				$var_prefix.'parent_node_field_data' => (isset($parent_node['field_data'])) ? $parent_node['field_data'] : '',
				$var_prefix.'parent_node_status' => (isset($parent_node['status'])) ? $parent_node['status'] : '',
				$var_prefix.'parent_node_highlight' => (isset($parent_node['highlight'])) ? $parent_node['highlight'] : '',
				$var_prefix.'parent_node_title' => (isset($parent_node['title'])) ? $parent_node['title'] : '',
				$var_prefix.'parent_node_url_title' => (isset($parent_node['url_title'])) ? $parent_node['url_title'] : '',
				$var_prefix.'parent_node_entry_date' => (isset($parent_node['entry_date'])) ? $parent_node['entry_date'] : '',
				$var_prefix.'parent_node_template_id' => (isset($parent_node['template_id'])) ? $parent_node['template_id'] : '',
				$var_prefix.'parent_node_group_id' => (isset($parent_node['group_id'])) ? $parent_node['group_id'] : '',
				$var_prefix.'parent_node_template_name' => (isset($parent_node['template_name'])) ? $parent_node['template_name'] : '',
				$var_prefix.'parent_node_group_name' => (isset($parent_node['group_name'])) ? $parent_node['group_name'] : '',
				$var_prefix.'parent_node_is_site_default' => (isset($parent_node['is_site_default'])) ? $parent_node['is_site_default'] : '',
				$var_prefix.'parent_node_level' => (isset($parent_node['level'])) ? $parent_node['level'] : '',
				$var_prefix.'parent_node_level+1' => (isset($parent_node['level'])) ? $parent_node['level']+1 : '',
				$var_prefix.'parent_node_level+2' => (isset($parent_node['level'])) ? $parent_node['level']+2 : '',
				$var_prefix.'parent_node_level-1' => (isset($parent_node['level'])) ? $parent_node['level']-1 : '',
				$var_prefix.'parent_node_level-2' => (isset($parent_node['level'])) ? $parent_node['level']-2 : '',
				$var_prefix.'parent_node_has_children' => (isset($parent_node['has_children'])) ? $parent_node['has_children'] : ''
			);

		 }
		
		if($store_vars != 'no')
		{
			$this->EE->config->_global_vars = array_merge($variables, $this->EE->config->_global_vars);
		}
		// print_r($this->EE->config->_global_vars);
		
		$tmp = $this->EE->functions->prep_conditionals($tagdata, $variables);

		return $this->EE->functions->var_swap($tmp, $variables);
	}
	
	// ----------------------------------------------------------------
	
	// get_node is a tag pair, set_node does the same but can be used as a single tag
	
	public function set_node()
	{
		return $this->get_node();
	}
	
	// ----------------------------------------------------------------
	
	// returns the next or previous node
	
	public function sibling_node($direction = 'next')
	{
		
		$tree_id = $this->_get_tree_id();	
		if ( !$this->EE->ttree->check_tree_table_exists($tree_id))
			return false;
		
		$hide_dt_group = $this->_get_param('hide_dt_group');
		
		// fetch our current entry_id 
		if($this->_get_param('entry_id') != '')
		{
			$key = 'entry_id';
			$val = $this->_get_param('entry_id');
		}
		elseif($this->_get_param('node_id') != '')
		{
			$key = 'node_id';
			$val = $this->_get_param('node_id');
		}
		elseif(
			isset($this->EE->session->cache['taxonomy']['this_node']['entry_id'])
			&& $this->EE->session->cache['taxonomy']['this_node']['entry_id'] != ''
		  )
		{
			$key = 'entry_id';
			$val = $this->EE->session->cache['taxonomy']['this_node']['entry_id'];
		}
		elseif(
			isset($this->EE->session->cache['taxonomy']['this_node']['node_id'])
			&& $this->EE->session->cache['taxonomy']['this_node']['node_id'] != ''
		  )
		{
			$key = 'node_id';
			$val = $this->EE->session->cache['taxonomy']['this_node']['node_id'];
		}
		else
		{
			$key = $this->_get_param('key', '');
			$val = $this->_get_param('val', '');
		}			

		$tree_array = (isset($this->EE->session->cache['taxonomy']['tree'][$tree_id]['tree_array']))
						? $this->EE->session->cache['taxonomy']['tree'][$tree_id]['tree_array']
						 : $this->EE->ttree->tree_to_array(1);
        
        $this->EE->TMPL->log_item("TAXONOMY:nav -> Finding node: $key => $val");
        
        $this->EE->ttree->find_node($tree_array[0], $key, $val);
		$node = (isset($this->EE->session->cache['taxonomy']['temp_node'])) ? $this->EE->session->cache['taxonomy']['temp_node'] : array();
		unset($this->EE->session->cache['taxonomy']['temp_node']);
		
		$this->EE->TMPL->log_item("TAXONOMY:nav -> Node found");
		
		if(isset($node['rgt'])) // found our current node
		{
			if($direction == 'next')
			{
				$key = 'lft';
				$val = $node['rgt']+1;
			}
			else // prev
			{
				$key = 'rgt';
				$val = $node['lft']-1;
			}
			
			$this->EE->TMPL->log_item("TAXONOMY:nav -> Finding node: $key => $val");
			
			$this->EE->ttree->find_node($tree_array[0], $key, $val); // find our next/previous node
			$next_node = (isset($this->EE->session->cache['taxonomy']['temp_node'])) ? $this->EE->session->cache['taxonomy']['temp_node'] : array();
			unset($this->EE->session->cache['taxonomy']['temp_node']);
			
			$this->EE->TMPL->log_item("TAXONOMY:nav -> Node found");
			
			if(count($next_node))
			{
			
				foreach($next_node as $key => $val)
				{
					$vars[$direction.'_'.$key] = $val;
				}

				$vars[$direction.'_node_title'] = $next_node['label'];

				if($next_node['field_data'] != '')
				{
					$fields = $this->unserialize($next_node['field_data']);
					foreach($fields as $field_key => $field_value)
					{
						$vars[$direction.'_'.$field_key] = $field_value;
					}
				}
				
				// stash node urls in the session array if they're not set
				if ( ! isset($this->EE->session->cache['taxonomy']['tree'][$tree_id]['entry_urls']))
				{
					$this->EE->ttree->stash_node_urls_array($tree_id, $hide_dt_group);
				}
				
				$vars[$direction.'_node_url'] = 
					(isset($this->EE->session->cache['taxonomy']['tree'][$tree_id]['entry_urls']['node_id:'.$vars[$direction.'_node_id']])) 
						? $this->EE->session->cache['taxonomy']['tree'][$tree_id]['entry_urls']['node_id:'.$vars[$direction.'_node_id']] : '';

				$tagdata = $this->EE->TMPL->tagdata;
				$tmp = $this->EE->functions->prep_conditionals($tagdata, $vars);
				return $this->EE->functions->var_swap($tmp, $vars);
			}
		}

	}
	
	public function prev_node()
	{
		return $this->sibling_node('prev');
	}
	
	public function next_node()
	{
		return $this->sibling_node('next');
	}
	
	// ----------------------------------------------------------------
	
	// just playing
	public function variable()
	{
		$var = $this->EE->TMPL->fetch_param('var');		
		return (isset($this->EE->config->_global_vars[$var])) ? $this->EE->config->_global_vars[$var] : '';
		
	} 
	
	// ----------------------------------------------------------------
	
	
	public function entries()
	{
		$this->EE->load->library('taxonomy_entries');
		return $this->EE->taxonomy_entries->entries();
	}
	
	// ----------------------------------------------------------------
	

	public function prep_vars()
	{
		$prefix = $this->EE->TMPL->tagparams['var_prefix'];
		return str_replace($prefix, '', $this->EE->TMPL->tagdata);

	}
	
	
	// ----------------------------------------------------------------
	

	public function simple_nav()
	{
		$tree_id = $this->EE->TMPL->fetch_param('tree_id');

		if ( ! $this->EE->ttree->check_tree_table_exists($tree_id))
			return false;
			
		return $this->build_simple_list();
		
	}

	
	// ----------------------------------------------------------------

	
	function build_simple_list($session_data = NULL)
	{
		$session_data = (isset($session_data)) ? $session_data : $this->EE->session->cache['taxonomy']['tree'][1]['tree_array'];
		$str = "<ul>\n";
	    foreach($session_data as $data)
	    {
	    	
	        $str .= "<li>";
	        $str .= '<a href="">'.$data['label'].'</a>'; // whatever you want between the <li> </li>
	        if(isset($data['children'])){
	            $str .= $this->build_simple_list($data['children']);
	        }
	        $str .= "</li>\n";
	    }
	    $str .= "</ul>\n";
	    return $str;
	}


	// ----------------------------------------------------------------	
	
	
	/**
     * Helper function for getting a parameter
	 */		 
	function _get_param($key, $default_value = '')
	{
		$val = $this->EE->TMPL->fetch_param($key);
		
		if($val == '') {
			return $default_value;
		}
		return $val;
	}
	
	
	// ----------------------------------------------------------------
	
	
	/**
     * Get the tree id from param, or session_cach if param not used.
	 */		 
	function _get_tree_id()
	{
		// do we have a globally set tree id (if the param is not set
		if($this->EE->TMPL->fetch_param('tree_id') == '' && isset($this->EE->session->cache['taxonomy']['this_node']['tree_id']))
		{
			$tree_id = $this->EE->session->cache['taxonomy']['this_node']['tree_id'];
		}
		else
		{
			$tree_id = (int) $this->EE->TMPL->fetch_param('tree_id');
		}
		return $tree_id;
	}
	
	
	// --------------------------------------------------------------------


	/**
	 * unserialize
	 * 
	 * @access	public
	 * @param	mixed $data
	 * @return	void
	 */
	protected function unserialize($data)
	{
		$data = @unserialize(base64_decode($data));
		
		return (is_array($data)) ? $data : array();
	}
	
	
	
}
/* End of file mod.taxonomy.php */
/* Location: /system/expressionengine/third_party/taxonomy/mod.taxonomy.php */