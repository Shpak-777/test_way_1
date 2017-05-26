<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

				$this->load->language('coloring/coloring');
				
				$this->load->model('setting/setting');
				$this->load->model('design/banner');
				$this->load->model('tool/image');

				$data['language_id'] = $this->config->get('config_language_id');
				
				$data['xds_coloring_theme'] = array();
				$data['xds_coloring_theme'] = $this->model_setting_setting->getSetting('xds_coloring_theme');
				
				$xds_coloring_theme = array();
				$xds_coloring_theme = $this->model_setting_setting->getSetting('xds_coloring_theme');
				
				$pay_icons_banner_id = -99;
				$data['pay_icons_toggle'] = false;
				$data['footer_map_toggle'] = false;
				$data['footer_map'] = array();

				if(!empty($xds_coloring_theme)){
					$pay_icons_banner_id = $xds_coloring_theme['pay_icons_banner_id'];
					$data['pay_icons_toggle'] = $xds_coloring_theme['pay_icons_toggle'];
					$data['footer_map_toggle'] = $xds_coloring_theme['footer_map_toggle'];
					$data['footer_map'] = $xds_coloring_theme['footer_map'];
				}
				
				$data['pay_icons'] = array();
				$pay_icons = $this->model_design_banner->getBanner($pay_icons_banner_id);
				
				foreach ($pay_icons as $pay_icon) {
					if (is_file(DIR_IMAGE . $pay_icon['image'])) {
						$data['pay_icons'][] = array(
							'title' => $pay_icon['title'],
							'link'  => $pay_icon['link'],
							'image' => $this->model_tool_image->resize($pay_icon['image'], 48, 32)
						);
					}
				}				
				
      

			$data['lang_id'] = $this->config->get('config_language_id');
			$data['callbackpro'] = $this->config->get('callbackpro');	
			

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		
				
				$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time())).$this->language->get('theme_powered');
      

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
}
