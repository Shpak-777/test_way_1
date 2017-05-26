 <!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="theme-color" content="#f5f5f5">
<title><?php echo $title; if (isset($_GET['page']) && isset($text_page)) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; if (isset($_GET['page']) && isset($text_page)) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; if (isset($_GET['page']) && isset($text_page)) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<meta property="og:type" content="website" />
<?php if (isset($og_url)) { ?>
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php } else { ?>
<meta property="og:url" content="<?php echo $og_url_coloring; ?>" />
<?php } ?>
<?php if (isset($og_image) && $og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/coloring/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<?php if (!empty($stylesheet)) { ?>
<link href="catalog/view/theme/coloring/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/coloring/assets/font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet" >
<link href="catalog/view/theme/coloring/stylesheet/stylesheet.css" rel="stylesheet">
<?php } ?>
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/theme/coloring/assets/jquery.dotdotdot.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/coloring/assets/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


<style>
.popup {
background: #fff;
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
top: 0;
right: 0;
left: 0;
z-index: 10;
display: block;
visibility: hidden;
margin: 0 auto;
border-radius: 10px;
min-width: 40%;
max-width: 40%;
/* фиксированное позиционирование, окно стабильно при прокрутке */
position: fixed;
padding: 55px;
/* полная прозрачность окна, появление при клике */
opacity: 0;
/* эффект перехода (появление) */
-webkit-transition: all ease .5s;
-moz-transition: all ease .5s;
-ms-transition: all ease .5s;
-o-transition: all ease .5s;
transition: all ease .5s;
z-index: 2147483647;
}

.popup b{
margin: 20px 0;
font-size: 15px;
color: #000;
}
.popup span { 
font-size: 30px;
color: #000;
margin: -15px;
padding: 20px;
font-weight: 700;
}
.popup p{
color: #000;
font-size: 15px;
margin-bottom: -2px;
margin-top: 5px;
}
.popup  input {
width: 100%;
height: 55px;
border-radius: 5px;
text-align: center;
font-size: 19px;
border: 1px solid #ccc;;
text-transform: uppercase;
}
.popup input:hover{
background: #eeebff;
}
.popup input:focus {
background: #f5f5f5;
}
.popup  button {
width: 100%;
height: 55px;
font-size: 17px;
background: #2454d9;
border-radius: 5px;
text-transform: uppercase;
font-weight: 700;
ont-size: 19px;
border: none;
font-family: Century Gothic, Helvetica, Arial, sans-serif;
color: #fff;
-moz-box-shadow:inset 0px 0px 9px #5e5e5e;
-webkit-box-shadow:inset 00px 0px 9px #5e5e5e;
box-shadow:inset 0px 0px 9px #5e5e5e;
}
.popup  button:hover {
	background: #1d47b9;
}

/* Базовые стили слоя затемнения и модального окна  */
.overlay {
top: 0;
right: 0;
bottom: 0;
left: 0;
z-index: 1;
visibility: hidden;
/* фон затемнения */
background-color: rgba(0, 0, 0, 0.7);
opacity: 0;
position: fixed; /* фиксированное поцизионирование */
cursor: default; /* тип курсара */
-webkit-transition: opacity .5s;
-moz-transition: opacity .5s;
-ms-transition: opacity .5s;
-o-transition: opacity .5s;
transition: opacity .5s;
z-index: 2147483647;
}
.overlay:target {
visibility: visible;
opacity: 1;
}

.overlay:target+.popup {
top: 20%;
visibility: visible;
opacity: 1;
}
/* формируем кнопку закрытия */
.close-ty {
position: absolute;
top: -45px;
right: -45px;
padding: 0;
width: 50px;
height: 50px;
border: none;
-webkit-border-radius: 55px;
-moz-border-radius: 55px;
-ms-border-radius: 55px;
-o-border-radius: 55px;
border-radius: 55px;
background-color: rgba(35, 84, 217, 0.9);
text-align: center;
text-decoration: none;
font-weight: bold;
line-height: 48px;
-webkit-transition: all ease .8s;
-moz-transition: all ease .8s;
-ms-transition: all ease .8s;
-o-transition: all ease .8s;
transition: all ease .8s;
z-index: 2147483647;
}
.close-ty:before {
color: rgba(255, 255, 255, 0.9);
content: "X";
text-shadow: 0 -1px rgba(0, 0, 0, 0.9);
font-size: 25px;
}
.close-ty:hover {
background-color: #2454d9;
-webkit-transform: rotate(360deg);
-moz-transform: rotate(360deg);
-ms-transform: rotate(360deg);
-o-transform: rotate(360deg);
transform: rotate(360deg);   
text-decoration: none; 
}

@media only screen and (max-width: 1000px){
.popup {
min-width: 98%;
max-width: 98%;
padding: 15px;
}
.close-ty {
top: -55px;
right: 5px;
}
}

}


</style>


			<script type="text/javascript">
var loading_callbackpro = '<img src="catalog/view/theme/default/image/callpro_loading.svg" />';	
function get_modal_callbacking() {		
		$.magnificPopup.open({
            tLoading: loading_callbackpro,
            items: {
              src: 'index.php?route=module/callback',
              type: 'ajax'
            },
          });
	}
</script>
<?php if($callbackpro['select_design_theme_callback'] =='1'){?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/callback.css" />
<?php } else { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/callback2.css" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/csscallback.css" />
<script src="catalog/view/javascript/jquery/maskedinput.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js" type="text/javascript"></script>
<link media="screen" href="catalog/view/javascript/jquery/magnific/magnific-popup.css" type="text/css" rel="stylesheet">
<script src="catalog/view/javascript/callback_send.js" type="text/javascript"></script>

<?php if(isset($callbackpro['status_animate_btn_4'])){ ?>
<div onclick="get_modal_callbacking();" id="animate_btn_4" class="animate_btn_4">
	<div class="ab4-circlephone"></div>
	<div class="ab4-circle-fill"></div>
	<div class="ab4-img-circle"><div class="ab4-img-circleblock"></div></div>
</div>
<?php } ?>
<?php if(isset($callbackpro['status_animate_btn_3'])){ ?>
<div onclick="get_modal_callbacking();" id="animate_btn_3" class="animate_btn_3">
    <div class="ab3-track"></div>
    <div class="ab3-back-circle"></div>
    <div class="ab3-circle">
        <div class="ab3-handset"></div>
    </div>
</div>
<?php } ?>
<?php if(isset($callbackpro['status_animate_btn_2'])){ ?>
<div onclick="get_modal_callbacking();" id="tcb-call">
	<div class="tcb-phone">
		<div class="tcb-phone-img"></div>
	</div>
	<div class="tcb-layout1"></div>
	<div class="tcb-layout2"></div>
	<div class="tcb-layout3"></div>
</div>
<?php } ?>
<?php if(isset($callbackpro['status_animate_btn_1'])){ ?>
<div onclick="get_modal_callbacking();" id="tcb_call_1">
	<div class="tcb_phone_1">
		<div class="tcb_phone_img_1"></div>
	</div>
	<div class="tcb_layout_1"></div>
	<div class="tcb_layout_2"></div>
</div>
<?php } ?>
<?php if(isset($callbackpro['config_right_callback_position_fixed'])){ ?>
<div onclick="get_modal_callbacking();" id="callback"  class="callback-view"><div><img src="image/data/callback.png"/></div></div>
<?php } ?>

			
</head>
<body class="<?php echo $class; ?>">
<header>
	<div id="top">
		<div class="container text-center text-right-md" >
			<div class="pull-left">
				<div class="inline-block">
					<?php echo $language; ?>
				</div>
				<div class="inline-block">
					<?php echo $currency; ?>
				</div>
			</div>
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
						<i class="glyphicon glyphicon-user icon"></i>
						<?php if ($logged) { ?>
						<span class="hidden-sm hidden-xs">&nbsp;&nbsp;<?php echo $user_name; ?>&nbsp;</span>
						<?php } else { ?>
						<span class="hidden-sm hidden-xs">&nbsp;&nbsp;<?php echo $text_account; ?>&nbsp;</span>
						<?php } ?>
						<span class="fa fa fa-angle-down caretalt"></span>
					</button>	
					<ul class="dropdown-menu pull-right">
						<?php if ($logged) { ?>
						<li><a href="<?php echo $account; ?>"><i class="fa fa-area-chart fa-fw dropdown-menu-icon"></i>&nbsp;&nbsp;<?php echo $text_account; ?></a></li>
						<li><a href="<?php echo $order; ?>"><i class="fa fa-history fa-fw dropdown-menu-icon"></i>&nbsp;&nbsp;<?php echo $text_order; ?></a></li>
						<li><a href="<?php echo $transaction; ?>"><i class="fa fa-credit-card fa-fw dropdown-menu-icon"></i>&nbsp;&nbsp;<?php echo $text_transaction; ?></a></li>
						<li><a href="<?php echo $download; ?>"><i class="fa fa-download fa-fw dropdown-menu-icon"></i>&nbsp;&nbsp;<?php echo $text_download; ?></a></li>
						<li><a href="<?php echo $logout; ?>"><i class="fa fa-sign-out fa-fw dropdown-menu-icon"></i>&nbsp;&nbsp;<?php echo $text_logout; ?></a></li>
						<?php } else { ?>
						<li><a href="<?php echo $login; ?>"><i class="fa fa-sign-in fa-fw dropdown-menu-icon"></i>&nbsp;&nbsp;<?php echo $text_login; ?></a></li>
						<li><a href="<?php echo $register; ?>"><i class="fa fa-pencil fa-fw dropdown-menu-icon"></i>&nbsp;&nbsp;<?php echo $text_register; ?></a></li>
						<?php } ?>
					</ul>
				</div>
			</div>
			<?php if ($help_menu_toggle) {?>
			<div class="pull-right <?php echo $help_menu_left; ?>">
				<div class="btn-group">
					<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-support icon"></i><span class="hidden-sm hidden-xs">&nbsp;&nbsp;<?php echo $help_menu_text; ?>&nbsp;</span>&nbsp;<i class="fa fa fa-angle-down caretalt"></i>
					</button>	
					<ul class="dropdown-menu <?php if (!$help_menu_left){echo 'pull-right';} ?>">
						<?php foreach ($help_menu as $item) { ?>
						<li><a href="<?php echo $item['link'][$language_id]; ?>"><?php echo html_entity_decode($item['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?></a></li>
						<?php } ?>
					</ul>
				</div>
			</div>
			<?php }?>
			
			<div class="btn-group">
				<!--<a class="btn" href="#win-z-z" style="border: 1px solid ##337ab7; color: #fff; background: #337ab7;" id="wishlist-total">Заказать звонок</a>-->
				<a class="btn" href="javascript:void(0)" onclick="get_modal_callbacking()" style="border: 1px solid ##337ab7; color: #fff; background: #337ab7;" id="wishlist-total">Заказать звонок</a>
			</div>
			<!--
			<div class="btn-group">
				<a class="btn" href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a>
			</div>
			<div class="btn-group">
				<a class="btn" href="<?php echo $header_product_compare_link; ?>" id="compare-total"><?php echo $header_product_compare; ?></a>
			</div>
			-->
		</div>
	</div>
  <div class="container">
    <div class="row logo-line">
      <div class="col-sm-12 col-md-3">
        <div id="logo">
          <?php if ($logo) { ?>
						<?php if (isset($og_url_coloring) && ($home == $og_url_coloring)) { ?>
							<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
						<?php } else { ?>
							<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
						<?php } ?>
          <?php } else { ?>
					<div class="btn-group btn-block">
						<button type="button" class="btn btn-link btn-block">
							<a href="<?php echo $home; ?>"><?php echo $name; ?></a>
						</button>
					</div>
          <?php } ?>
				</div>
      </div>
			<div class="col-sm-12 col-md-3 text-center text-left-md">
				<?php if ($header_contacts_toggle) {?>
				<div id="phone">
					<div class="phone">
						<span data-toggle="dropdown" class="main-phone">
							<i class="glyphicon glyphicon-phone-alt icon"></i>&nbsp;
							<?php echo $main_telephone[$language_id]; ?>
							<?php if ($header_add_contacts_toggle) {?>
							<span class="fa fa fa-angle-down caretalt"></span>
							<?php }?>
						</span>
						<?php if ($header_add_contacts_toggle) {?>
						<ul class="dropdown-menu allcontacts">
							<?php if (!empty($all_phones)) {?>
							<?php foreach ($all_phones as $item) { ?>
							<li>
								<a href="tel:<?php echo $item['title'][$language_id]; ?>">
									<?php if ($item['image']) {?>
									<img src="image/<?php echo $item['image']; ?>" class="max16" />&nbsp;
									<?php } ?>
									<?php echo html_entity_decode($item['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?>
								</a>
							</li>
							<?php } ?>
							<li class="divider"></li>
							<?php }?>
							<?php if ($contact_schedule[$language_id]) {?>
							<li>
								<div class="schedule">
									<i class="fa fa-clock-o fu"></i>&nbsp;
									<?php echo html_entity_decode($contact_schedule[$language_id], ENT_QUOTES, 'UTF-8'); ?>
								</div>
							</li>
							<li class="divider"></li>
							<?php }?>
							<li>
								<?php if (!empty($contact_email[$language_id])) {?>
								<a href="mailto:<?php echo $contact_email[$language_id]; ?>" target="_blank"><i class="fa fa-envelope-o fu"></i>&nbsp;
								<?php echo $contact_email[$language_id]; ?></a>
								<?php }?>
								
								<?php if (!empty($other_contacts)) {?>
								<?php foreach ($other_contacts as $item) { ?>
								<a href="<?php echo $item['link'][$language_id]; ?>" target="_blank">
									<?php if ($item['image']) {?>
									<img src="image/<?php echo $item['image']; ?>" class="max16" />&nbsp;
									<?php } ?>
									<?php echo html_entity_decode($item['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?>
								</a>
								<?php } ?>
								<?php }?>
							</li>
						</ul>
						<?php }?>
					</div>
					<br>
					<span class="hint"><?php echo $contact_hint[$language_id]; ?></span>
				</div>
				<?php }?>
			</div>
			<div class="col-sm-12 col-md-6 text-center text-right-md">
				<div id="header-menu">
				<?php if ($header_menu_toggle) {?>
				<?php foreach ($header_menu as $item) { ?>
				<a class="btn" href="<?php echo $item['link'][$language_id]; ?>"><span><?php echo html_entity_decode($item['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?></span></a>
				<?php } ?>
				<?php }?>
				</div>
			</div>
    </div>
  </div>
	<div class="container">
		<div class="row menu-line">
			<div class="col-sm-12 col-md-7 col-md-push-3 search-box"><?php echo $search; ?></div>
			<div class="col-sm-6 col-sm-push-6 col-md-2 col-md-push-3 cart-box"><?php echo $cart; ?></div>
			<div class="col-sm-6 col-sm-pull-6 col-md-3 col-md-pull-9 menu-box">
				<?php if ($categories) { ?>
				<nav id="menu" class="btn-group btn-block">
					<button type="button" class="btn btn-danger btn-block dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-bars"></i>
						<?php echo $text_category; ?>
					</button>
					<ul id="menu-list" class="dropdown-menu">
						<?php foreach ($categories as $category) { ?>
						<?php if ($category['children']) { ?>
						<li>
							<span class="toggle-child">
								<i class="fa fa-plus plus"></i>
								<i class="fa fa-minus minus"></i>
							</span>
							<a class="with-child" href="<?php echo $category['href']; ?>">
								<i class="fa fa-angle-right arrow"></i>
								<?php echo $category['name']; ?>
							</a>
							<?php if ($category['column'] < 2) { ?>
								<?php	$col_class = 'col-md-12'; ?>
								<?php	$box_class = 'box-col-1'; ?>
								<?php	$cols_count = 1; ?>
							<?php } elseif ($category['column'] == 2) { ?>
								<?php	$col_class = 'col-md-6'; ?>
								<?php	$box_class = 'box-col-2'; ?>
								<?php	$cols_count = 2; ?>
							<?php } else { ?>
								<?php	$col_class = 'col-md-4'; ?>
								<?php	$box_class = 'box-col-3'; ?>
								<?php	$cols_count = 3; ?>
							<?php } ?>
							<div class="child-box <?php echo $box_class; ?>">
								<div class="row">
								<?php $i = 0; ?>
								<?php foreach ($category['children'] as $child) { ?>
								<div class="<?php echo $col_class; ?>">
									<div class="child-box-cell">
										<h5>
										<?php if($child['children2']) {?>
										<span class="toggle-child2">
											<i class="fa fa-plus plus"></i>
											<i class="fa fa-minus minus"></i>
										</span>
										<?php } ?>
										<a href="<?php echo $child['href']; ?>" class="<?php if($child['children2']) {echo 'with-child2';}?>"><span class="livel-down visible-xs-inline">&#8627;</span><?php echo $child['name']; ?></a></h5>
										<?php if($child['children2']) {?>
										<ul class="child2-box">
										<?php foreach ($child['children2'] as $child2) { ?>
											<li><a href="<?php echo $child2['href']; ?>"><span class="livel-down">&#8627;</span><?php echo $child2['name']; ?></a></li>
										<?php } ?>
										</ul>
										<?php } ?>
									</div>
								</div>
									<?php $i++; ?>
									<?php if (($i == $cols_count) &($i != 1)) { ?>
									<div class="clearfix visible-md visible-lg"></div>
									<?php $i = 0; ?>
									<?php } ?>
								<?php } ?>
								</div>
							</div>
						</li>
						<?php } else { ?>
						<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
						<?php } ?>
						<?php } ?>
						<?php if ($add_category_menu_toggle) {?>
						<?php foreach ($add_category_menu as $item) { ?>
						<li><a href="<?php echo $item['link'][$language_id]; ?>"><?php echo html_entity_decode($item['title'][$language_id], ENT_QUOTES, 'UTF-8'); ?></a></li>
						<?php } ?>
						<?php }?>
					</ul>
					<?php if ($category_mask) {?>
					<div id="menuMask"></div>
					<script>$('#menu-list').hover(function () {$('body').addClass('blured')},function () {$('body').removeClass('blured')});</script>
					<?php }?>
				</nav>
				<?php } ?>
			</div>
		</div>
	</div>
</header>
<div class="content-wrapper">