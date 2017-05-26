</div>
<footer>
<?php if ($footer_map_toggle) { ?>	
<div id="footer-map" >
<div class="container">
	<div class="map-content ">
		<?php echo html_entity_decode($footer_map, ENT_QUOTES, 'UTF-8'); ?>
		<div class="btn-group close-map">
			<button type="button" class="btn btn-danger" onclick="toogleMap()"><i class="fa fa-times"></i> Закрыть</button>
		</div>
		<div class="glass"></div>
	</div>
	<div class="map-toogle" data-toggle="tooltip" data-trigger="hover" title="Развернуть схему проезда">
		<a id="mapToogle" onclick="toogleMap();">
			<span class="glyphicon glyphicon-map-marker"></span>
		</a>
	</div>
</div>
</div>
<?php } ?>

  <div class="container">
		<div class="footer-box">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-6 col-md-3">
        <h5><i class="fa fa-info-circle"></i><span><?php echo $text_information; ?></span></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
				<hr class="visible-xs">
      </div>
      <?php } ?>
      
			<div class="clearfix visible-sm">&nbsp;</div>
      <div class="col-sm-6 col-md-3">
        <h5><i class="glyphicon glyphicon-pushpin"></i><span><?php echo $text_extra; ?></span></h5>
        <ul class="list-unstyled">
          <!--<li><i class="fa fa-angle-right"></i><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>-->
          <li><i class="fa fa-angle-right"></i><a href="http://way-prokat.ru/index.php?route=product/category&path=64">Каталог</a></li>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
				<hr class="visible-xs">
      </div>
     
      <div class="col-sm-6 col-md-3">
        <h5><i class="glyphicon glyphicon-user"></i><span><?php echo $text_account; ?></span></h5>
        <ul class="list-unstyled">
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <!--<li><i class="fa fa-angle-right"></i><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>-->
        </ul>
                <hr class="visible-xs">
      </div>
      
      <div class="col-sm-6 col-md-3">
        <h5><i class="fa fa-support"></i><span><?php echo $text_service; ?></span></h5>
        <ul class="list-unstyled">
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><i class="fa fa-angle-right"></i><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
          <br>
          <li><a class="btn" href="javascript:void(0)" onclick="get_modal_callbacking()" style="border: 1px solid ##337ab7; color: #fff; background: #337ab7;" id="wishlist-total">Заказать звонок</a></li>
        </ul>
				
      </div>
    </div>
    <hr>
    © Way prokat "Сервис по аренде камер и техники". Все права защищены. Сайт разработан: <a href="http://wsbuq.ru/" target="_blank"  style=" color: #337ab7;">WS buQ</a>
    <!--
		<div class="row">
			<div class="col-sm-12 col-md-4">
				<?php echo $powered; ?>
			</div>
			<?php if ($pay_icons_toggle) { ?>
			<div class="col-sm-12 col-md-8 text-right-md">
				<ul class="list-unstyled pay-icons">
					 <?php foreach ($pay_icons as $pay_icon) { ?>
					<li>
						<?php if ($pay_icon['link']) { ?>
						<a target="_blank" href="<?php echo $pay_icon['link']; ?>"><img src="<?php echo $pay_icon['image']; ?>" alt="<?php echo $pay_icon['title']; ?>" class="img-responsive" /></a>
						<?php } else { ?>
						<img src="<?php echo $pay_icon['image']; ?>" alt="<?php echo $pay_icon['title']; ?>" class="img-responsive" />
						<?php } ?>
					</li>
					<?php } ?>
				</ul>
			</div>
			<?php } ?>
		</div>
		</div>
		<span id="scroll-top-button"><i class="fa fa-arrow-circle-up"></i></span>
	-->
  </div>
</footer>
<link rel="stylesheet" href="https://cdn.envybox.io/widget/cbk.css">

<a href="#callbackwidget">Заказать звонок</a>
<script type="text/javascript" src="https://cdn.envybox.io/widget/cbk.js?wcb_code=ed0c7fa19a3b12ed00e750b706cc60e2" charset="UTF-8" async></script>

<!-- Yandex.Metrika counter -->
<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter39516165 = new Ya.Metrika({
                    id:39516165,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/39516165" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->


		<div class="container-pod">
			<a href="#q" class="overlay" id="win-z-z"></a>
				<div class="popup">
					<center>
					<span>Заказать обратный звонок</span>
					<br><br>
					<b>Заказ обратного звонка возможен круглосуточно. Мы перезвоним
					Вам с 10 до 23 по московскому времени. Гарантируем безопасности предоставленных данных.</b>
						<table>
						    <br><br><br>
							<form name="form" action="http://way-prokat.ru/php/zakazat_zvonok.php" method="POST">
								<p>Введите имя</p>
								<Input type="text" name="text" required placeholder="Петр"/>
								<br>
								<p>Введите телефон</p>
								<Input type="tel" name="tel" required placeholder="89281234567"/>
								<br><br>
								<button class="more-link" type="submit" title="Кликните что бы заказать звонок" value="Заказать звонок"/>Заказать звонок</button>
							<br><br>
							</form>
						</table>
					</center>
						<a class="close-ty" title="Закрыть" href="#close"></a>
				</div>
		</div>



			
</body></html>