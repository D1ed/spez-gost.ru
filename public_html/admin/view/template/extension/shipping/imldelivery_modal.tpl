<div class="iml_modal" id="iml_modal">
  <div class="iml-window">
  <div class="iml-bar">
    <div class="iml-close"><strong onclick="imlModalHide()">×</strong></div>
  </div>
  <div class="iml-content"></div>
    <div class="iml-btn-block">
      <button onclick="imlModalHide()">Закрыть</button>
    </div>
  </div>
</div>
<style>
.iml_modal
{
  top: 0px;
  left: 0px;
  position: fixed;
  width: 100%;
  height: 100%;
  visibility: hidden;
  opacity: 0;
  z-index: 100;
}

.iml_modal .iml-window
{
  font-size: 16px;
  border: 2px solid #ffc10782;
  width: 300px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  position: absolute;
  font-family: Arial;
  z-index: 99999;
  background: white;
}
.iml_modal .iml-bar
{ 
    background: #ffc10782;
    height: 30px;
    text-align: right;
    line-height: 30px;  
  
}

.iml_modal .iml-close
{
  cursor: pointer;
  display: inline-block;
  font-size: 20px;
  padding-right: 8px;
}

.iml_modal .iml-content
{
  padding: 20px 40px 10px 40px;
  font-size: 16px;
  text-align: justify;
}

.iml_modal .iml-btn-block
{
  text-align: center;
  margin: 20px;
}
.iml_modal button
{
    text-align:: center;
    background: #ffc147;
    color: #253244;
    border: 1px solid transparent;
    border-radius: 4px;
    text-transform: uppercase;
    padding: 10px 20px;
    font-weight: 700;
    display: inline-block;
    cursor: pointer;
    font-size:  12px;
}

.iml_modal button:hover
{
  padding: 10px 22px;
}


.iml_modal_showed
{
  visibility: visible;
  opacity: 1;
}
</style>
<script>
function imlModalShow(text)
{
    if(!text)
    {
        return;
    }
    var modal = document.getElementById('iml_modal');
	if(modal)
	{

        var content = modal.getElementsByClassName('iml-content')[0];
        if(content)
        {
            content.innerHTML = text;
        }
		if(!modal.classList.contains('iml_modal_showed'))
		{
			modal.classList.add('iml_modal_showed');
		}
	}

}

function imlModalHide()
{
    var modal = document.getElementById('iml_modal');
	if(modal)
	{
		if(modal.classList.contains('iml_modal_showed'))
		{
			modal.classList.remove('iml_modal_showed');
		}
	}
}
</script>
