test 'Model'

m = first(:models)
is m, :a? => Model
is m.doc, :a? => BSON::Document
is m.doc[:description], :a? => String
is m.description, 'hello'
is !m.tull

m.description = 'hello2'
is m.description, 'hello2'

m.choco = 'loco'
is m.choco, 'loco'

h = m.to_h
is h, :a? => Hash
is m['choco'], 'loco'

update(:models, {:_id => m._id}, :description => 'zero-g-airplanes')
m = first(:models, :_id => m._id)

is m.description, 'zero-g-airplanes'
is m.choco, nil

m.choco = 'loco'
update(:models, {:_id => m._id}, m.to_h)
is m.choco, 'loco'

m = first(:models, :_id => m._id)
is m.choco, 'loco'
