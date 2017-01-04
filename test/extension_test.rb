test 'Extension'

insert(:models, :description => 'hello') if count(:models) < 3
insert(:flats, :description => 'hello') if count(:flats) < 3

Modelize.enable = true

is !!Model, true
is !!Fu::Models::Flat, true

ms = find(:models).to_a
is ms.first, :a? => Model

m = first(:models)
is m, :a? => Model

Modelize.module = 'Fu::Models'

fs = find(:flats).to_a
is fs.first, :a? => Fu::Models::Flat

m = first(:flats)
is m, :a? => Fu::Models::Flat

Modelize.module = ''
Modelize.enable = false

ms = find(:models).to_a
is ms.first, :a? => BSON::Document

m = first(:models)
is m, :a? => BSON::Document
