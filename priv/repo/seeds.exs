# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Orders.Repo.insert!(%Orders.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Orders.Models.Product
alias Orders.Repo

Repo.insert! %Product{
  name: "Hat",
  price: 10050,
  description: "A hat for kings"
}

Repo.insert! %Product{
  name: "Speedo",
  price: 20000,
  description: "A suit that makes you fast"
}

Repo.insert! %Product{
  name: "Left Shoe",
  price: 35099,
  description: "Right shoe ordered separately"
}
