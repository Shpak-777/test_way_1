<?php
class ControllerModuleSpecial extends Controller {
	public function index($setting) {
		$this->load->language('module/special');

		$data['heading_title'] = $this->language->get('heading_title');

				$this->load->model('setting/setting');
				$xds_coloring = array();
				$xds_coloring = $this->model_setting_setting->getSetting('xds_coloring_theme');
				$language_id = $this->config->get('config_language_id');
				$data['disable_cart_button'] = false;
				if (isset($xds_coloring['disable_cart_button'])) {
					$data['disable_cart_button'] = $xds_coloring['disable_cart_button'];
				}
				$data['disable_cart_button_text'] = "";
				if (isset($xds_coloring['disable_cart_button_text'])) {
					$data['disable_cart_button_text'] = $xds_coloring['disable_cart_button_text'][$language_id];
				}
				
				$data['on_off_qview'] = false;
				if (isset($xds_coloring['on_off_qview'])) {
					$data['on_off_qview'] = $xds_coloring['on_off_qview'];
				}
				
				$this->load->language('coloring/coloring');
				$data['qview_text'] = $this->language->get('qview_text');
				
				$this->document->addScript('catalog/view/theme/coloring/assets/owl-carousel/owl.carousel.min.js');
				$this->document->addStyle('catalog/view/theme/coloring/assets/owl-carousel/owl.carousel.css');
				$this->document->addStyle('catalog/view/theme/coloring/assets/owl-carousel/owl.theme.css');
				
				$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
				$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
				$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
      

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$filter_data = array(
			'sort'  => 'pd.name',
			'order' => 'ASC',
			'start' => 0,
			'limit' => $setting['limit']
		);

		$results = $this->model_catalog_product->getProductSpecials($filter_data);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}

				$data['products'][] = array(

				'quantity'  => $result['quantity'],
				'qview'        => 'index.php?route=module/xds_qview&product_id=' . $result['product_id'],
      
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
			}

			return $this->load->view('module/special', $data);
		}
	}
}