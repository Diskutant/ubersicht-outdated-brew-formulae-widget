command: "outdated-brew-formulae.widget/pingTest.sh"

refreshFrequency: 3600000 # every hour

style: """
  // Position the widget on your screen
  bottom: 50px
  right: 10px

  // Change the style of the widget
  color: #fff
  font-family: Helvetica Neue
  background: rgba(#000, .5)
  padding: 10px 10px 5px
  border-radius: 5px

  .container
    position: relative
    clear: both

  .list
    padding-top: 3px
    width:100%
    
  .list-item
    font-size: 10px
    font-weight: 300
    color: rgba(#fff, .9)
    text-shadow: 0 1px 0px rgba(#000, .7)

  .widget-title
    font-size: 10px
    text-transform: uppercase
    font-weight: bold
"""

render: -> """
  <div class="container">
    <div class="widget-title">Outdated Brews</div>
    <div id="formulae" class="list">
    </div>
  </div>
"""

update: (output, domElement) ->
  
  domElement.innerHTML = '<div class="container"><div class="widget-title">Outdated Brews</div><div id="formulae" class="list"></div></div>'
  
  formulae = output.split('\n')
  list = $(domElement).find('#formulae')
  
  addFormula = (formula) ->
    item = "<div class=\"list-item\">#{formula}</div>"
    list.append item
    
  if formulae.length == 1
  	#no outdated formulae, hide the widget
    $(domElement).find('.container').parent().attr("style", "display:none;")
  else
    $(domElement).find('.container').parent().attr("style", "display:block;")
    for formula, i in formulae
      addFormula(formula)
