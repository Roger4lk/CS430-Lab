require_relative 'html'
class main {
    make_tag('img', {src: 'bernie.jpg'}, :empty)
    make_tag('div', {id: 'root', class: 'frame'}, :sandwich)
    make_tag('Gallery', {}, :selfclose)
}
