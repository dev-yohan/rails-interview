require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  test "search by movie with substring must give a subset" do
    filter = "Tabo"
    assert(Student.by_movie(filter).count > 1, 'we get student that likes taboo movie')
  end

  test "test that repeated names be transformed to firstname plus first character of lastname and a dot" do
    jimmy_g = Student.where(firstname: "Jimmy", lastname: "Garrapolo").first
    jimmy_b = Student.where(firstname: "Jimmy", lastname: "Butler").first

    assert(jimmy_g.name == "Jimmy G.", 'Jimmy Garrapolo renders as Jimmy G.')
    assert(jimmy_b.name == "Jimmy B.", 'Jimmy Butler renders as Jimmy B.')
  end

  test "unique names does not be transformed" do
    kobe = Student.where(firstname: "Kobe", lastname: "Bryant").first
    assert(kobe.name == "Kobe", 'Kobe Bryant displayed as Kobe.')
  end

end
