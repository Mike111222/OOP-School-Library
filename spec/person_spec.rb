require_relative '../person'
require 'rspec'

describe Person do
  let(:person) { Person.new(name: 'John Doe', age: 25) }

  describe '#initialize' do
    it 'creates a person with default values' do
      expect(person.id).to be_an(Integer)
      expect(person.name).to eq('John Doe')
      expect(person.age).to eq(25)
      expect(person.rentals).to be_empty
      expect(person.can_use_services?).to be_truthy
    end

    it 'creates a person with a specified id' do
      person_with_id = Person.new(name: 'Alice', age: 30, id: 42)
      expect(person_with_id.id).to eq(42)
    end
  end

  describe '#can_use_services?' do
    it 'returns true for a person of age' do
      person = Person.new(name: 'Eve', age: 18)
      expect(person.can_use_services?).to be_truthy
    end

    it 'returns true if parent permission is granted' do
      person = Person.new(name: 'Bob', age: 15, parent_permission: true)
      expect(person.can_use_services?).to be_truthy
    end

    it 'returns false for a minor without parent permission' do
      person = Person.new(name: 'Charlie', age: 16, parent_permission: false)
      expect(person.can_use_services?).to be_falsey
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq('John Doe')
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the person' do
      book = Book.new(title: 'Sample Book', author: 'Sample Author')
      rental = person.add_rental('2023-08-31', book)
      expect(person.rentals).to include(rental)
    end
  end

  describe '.select' do
    it 'selects a person by id from a list of persons' do
      persons = [
        Person.new(name: 'Alice', age: 30, id: 1),
        Person.new(name: 'Bob', age: 25, id: 2),
        Person.new(name: 'Charlie', age: 18, id: 3)
      ]
      selected_person = Person.select(2, persons)
      expect(selected_person).not_to be_nil
      expect(selected_person.id).to eq(2)
    end
  end
end
