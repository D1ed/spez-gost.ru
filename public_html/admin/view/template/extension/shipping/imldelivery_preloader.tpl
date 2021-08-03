<style>
.iml_preloader
{
  position: fixed;
  left: 0px;
  top: 0px;
  width: 100%;
  height: 100%;
/*   background: black; */
  z-index: 9999999;
  transition: 1s all;
  visibility: hidden;
  opacity: 0;  
}

.iml_loader
{
	top: 50%;
	left: 50%;
	position: absolute;
	width: 90px;
	height: 90px;
	transform: translate(-50%, -50%);
	border: 10px solid #ccc;
	border-top-color: #f3c500;
	border-radius: 50%;
	animation:  1.7s myspin infinite ease;
}

.iml_preloader_show
{
  opacity: 1;
  visibility: visible;
}

@keyframes myspin
{
  0%
  {
    transform: translate(-50%, -50%) rotate(0deg);
  }
 100%
  {
    transform: translate(-50%, -50%) rotate(360deg);
  }  
}
</style>
<div id="iml-preloader" class="iml_preloader">
  <div class="iml_loader"></div>
</div>
<script>
function preloaderShow()
{

	var preloader = document.getElementById('iml-preloader');
	if(preloader)
	{
		if(!preloader.classList.contains('iml_preloader_show'))
		{
			preloader.classList.add('iml_preloader_show');
		}
	}
	
}


function preloaderHide()
{

	var preloader = document.getElementById('iml-preloader');
	if(preloader)
	{
		if(preloader.classList.contains('iml_preloader_show'))
		{
			preloader.classList.remove('iml_preloader_show');
		}
	}
	
}
</script>
