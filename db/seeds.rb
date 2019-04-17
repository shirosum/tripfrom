# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
    [
        {
            email: "admin@admin.com",
            password: "admin.com",
            user_name: "admin",
            admin: true
        },
        {
            email: "shiro@shiro.com",
            password: "shiro.com",
            user_name: "shiro"
        },
        {
            email: "sum@sum.com",
            password: "sum.com",
            user_name: "sum"
        }
    ]

)

Nation.create([
    {nation_name:"japan"},
    {nation_name:"algeria"},
    {nation_name:"argentina"},
    {nation_name:"brazil"},
    {nation_name:"canada"},
    {nation_name:"croatia"},
    {nation_name:"europe"},
    {nation_name:"france"},
    {nation_name:"germany"},
    {nation_name:"greece"},
    {nation_name:"indonesia"},
    {nation_name:"iran"},
    {nation_name:"iraq"},
    {nation_name:"new_regions_france"},
    {nation_name:"russia"},
    {nation_name:"serbia"},
    {nation_name:"tunisia"},
    {nation_name:"turkey"},
    {nation_name:"ukraine"},
    {nation_name:"usa"}
])