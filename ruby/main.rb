require_relative 'html'
class main {
    html.make_tag('img', {src: 'bernie.jpg'}, :empty)
    html.make_tag('div', {id: 'root', class: 'frame'}, :sandwich)
    html.make_tag('Gallery', {}, :selfclose)

}
