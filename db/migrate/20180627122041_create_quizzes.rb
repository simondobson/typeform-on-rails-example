class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :tarantino
      t.boolean :pineapple
      t.integer :messi
      t.string :fav_word
      t.string :weekday

      t.timestamps
    end
  end
end
