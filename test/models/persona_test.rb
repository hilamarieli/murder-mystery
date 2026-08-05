require "test_helper"

class PersonaTest < ActiveSupport::TestCase
  test "belongs to a case" do
    persona = Persona.new(name: "Iris Vale", narrative_role: :suspect)

    assert_not persona.valid?
    assert_includes persona.errors[:case], "must exist"
  end

  test "requires a name" do
    persona = Persona.new(case: cases(:one), narrative_role: :witness)

    assert_not persona.valid?
    assert_includes persona.errors[:name], "can't be blank"
  end

  test "defaults narrative role to other" do
    persona = Persona.new(case: cases(:one), name: "Iris Vale")

    assert_predicate persona, :other?
  end

  test "supports an optional photo" do
    persona = Persona.new(case: cases(:one), name: "Iris Vale")

    assert_not persona.photo.attached?
  end
end
