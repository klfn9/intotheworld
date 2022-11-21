# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create([
    { name: '海' },
    { name: '山' },
    { name: '森'},
    { name: '空'},
    { name: '建物'},
    { name: '自然'},
    { name: '水' },
    { name: '火' },
    { name: '動物'},
    { name: '植物'},
    { name: 'その他'},
    ])
    
Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)