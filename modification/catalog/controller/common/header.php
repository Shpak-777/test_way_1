<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

				$this->load->language('coloring/coloring');
				$this->load->model('setting/setting');

				$data['header_email_text'] = $this->language->get('header_email_text');
				$data['header_phone_text'] = $this->language->get('header_phone_text');	
				$data['header_address_text'] = $this->language->get('header_address_text');	
				
				$data['header_product_compare'] = sprintf($this->language->get('coloring_product_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));		

				$data['header_product_compare_link'] = $this->url->link('product/compare');
				
				$data['language_id'] = $this->config->get('config_language_id');
				$language_id = $this->config->get('config_language_id');

				$xds_coloring = array();
				$xds_coloring = $this->model_setting_setting->getSetting('xds_coloring_theme');
				$data['stylesheet'] = $xds_coloring;
				
				$data['header_menu'] = array();
				
				$data['header_menu_toggle'] = false;
				
				if (isset($xds_coloring['main_menu_toggle'])) {
					$data['header_menu_toggle'] = $xds_coloring['main_menu_toggle'];
				}
				
				if (isset($xds_coloring['main_menu_item'])) {
					$data['header_menu'] = $xds_coloring['main_menu_item'];
				}
				
				if (!empty($data['header_menu'])){
					foreach ($data['header_menu'] as $key => $value) {
						$sort_heder_menu[$key] = $value['sort'];
					} 
					array_multisort($sort_heder_menu, SORT_ASC, $data['header_menu']);
				}

				$data['help_menu_text'] = $this->language->get('header_help_support');
				
				if (isset($xds_coloring['help_menu_text'])) {
					if ($xds_coloring['help_menu_text'][$language_id] != '') {
						$data['help_menu_text'] = $xds_coloring['help_menu_text'][$language_id];
					}
				}
				
				$data['help_menu'] = array();
				$data['help_menu_toggle'] = false;
				$data['help_menu_left'] = '';
				
				if (isset($xds_coloring['help_menu_toggle'])) {
					$data['help_menu_toggle'] = $xds_coloring['help_menu_toggle'];
				}
				if (isset($xds_coloring['help_menu_left']) && $xds_coloring['help_menu_left']) {
					$data['help_menu_left'] = 'pull-left';
				}
				
				if (isset($xds_coloring['help_menu_item'])) {
					$data['help_menu'] = $xds_coloring['help_menu_item'];
				}
				
				if (!empty($data['help_menu'])){
					foreach ($data['help_menu'] as $key => $value) {
						$sort_help_menu[$key] = $value['sort'];
					} 
					array_multisort($sort_help_menu, SORT_ASC, $data['help_menu']);
				}
				
				
				$data['category_mask'] = '';
				
				if (isset($xds_coloring['category_mask_toggle'])) {
					$data['category_mask'] = $xds_coloring['category_mask_toggle'];
				}
				
				$data['add_category_menu'] = array();
				$data['add_category_menu_toggle'] = false;
				
				if (isset($xds_coloring['add_cat_links_toggle'])) {
					$data['add_category_menu_toggle'] = $xds_coloring['add_cat_links_toggle'];
				}
				
				if (isset($xds_coloring['add_cat_links_item'])) {
					$data['add_category_menu'] = $xds_coloring['add_cat_links_item'];
				}
				
				if (!empty($data['add_category_menu'])){
					foreach ($data['add_category_menu'] as $key => $value) {
						$sort_add_category_menu[$key] = $value['sort'];
					} 
					array_multisort($sort_add_category_menu, SORT_ASC, $data['add_category_menu']);
				}
				
				$data['header_contacts_toggle'] = false;
				
				if (isset($xds_coloring['contact_main_toggle'])) {
					$data['header_contacts_toggle'] = $xds_coloring['contact_main_toggle'];
				}
				
				$data['header_add_contacts_toggle'] = false;
				
				if (isset($xds_coloring['contact_add_toggle'])) {
					$data['header_add_contacts_toggle'] = $xds_coloring['contact_add_toggle'];
				}

				$data['main_telephone'] = "";
				
				if (isset($xds_coloring['contact_main_phone'])) {
					$data['main_telephone'] = $xds_coloring['contact_main_phone'];
				}
				
				$data['contact_hint'] = "";
				
				if (isset($xds_coloring['contact_hint'])) {
					$data['contact_hint'] = $xds_coloring['contact_hint'];
				}
				
				$data['contact_schedule'] = "";
				
				if (isset($xds_coloring['schedule'])) {
					$data['contact_schedule'] = $xds_coloring['schedule'];
				}
				
				$data['contact_email'] = "";
				
				if (isset($xds_coloring['contact_email'])) {
					$data['contact_email'] = $xds_coloring['contact_email'];
				}

				$data['all_phones'] = array();
				
				if (isset($xds_coloring['header_contact'])) {
					$data['all_phones'] = $xds_coloring['header_contact'];
				}
				
				if (!empty($data['all_phones'])){
					foreach ($data['all_phones'] as $key => $value) {
						$sort_all_phones[$key] = $value['sort'];
					} 
					array_multisort($sort_all_phones, SORT_ASC, $data['all_phones']);
				}
				
				$data['other_contacts'] = array();
				
				if (isset($xds_coloring['additional_contact'])) {
					$data['other_contacts'] = $xds_coloring['additional_contact'];
				}
				
				if (!empty($data['other_contacts'])){
					foreach ($data['other_contacts'] as $key => $value) {
						$sort_other_contacts[$key] = $value['sort'];
					} 
					array_multisort($sort_other_contacts, SORT_ASC, $data['other_contacts']);
				}
				
				$data['user_name'] = $this->customer->getFirstName();
				
				$data['og_url_coloring'] = (isset($this->request->server['HTTPS']) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));

      

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());

				$data['text_wishlist'] = sprintf($this->language->get('coloring_text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
      
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));

				$data['text_wishlist'] = sprintf($this->language->get('coloring_text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
      
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');

			$data['lang_id'] = $this->config->get('config_language_id');
			$data['callbackpro'] = $this->config->get('callbackpro');	
			
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {

				$children2_data = array();
				$children2 = $this->model_catalog_category->getCategories($child['category_id']);
				foreach ($children2 as $child2) {
					$filter2_data = array(
						'filter_category_id'  => $child2['category_id'],
						'filter_sub_category' => true
					);
					$children2_data[] = array(
						'name'  => $child2['name'] . ($this->config->get('config_product_count') ? ' <span class="count">' . $this->model_catalog_product->getTotalProducts($filter2_data) . '</span>' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'].'_'. $child2['category_id'])
					);
				}
      
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(

				'category_id' => $child['category_id'],
				'children2'    => $children2_data,
      
						
				'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' <span class="count">' . $this->model_catalog_product->getTotalProducts($filter_data) . '</span>' : ''),
				
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}
}
