class CreateNewsletterItems < ActiveRecord::Migration[6.0]
  def change
    create_table :newsletter_items do |t|
      t.belongs_to :story
      t.belongs_to :newsletter

      t.timestamps
    end
  end
end
