class Dev < ActiveRecord::Base
    has_many :freebies, dependent: :destroy
    has_many :companies, through: :freebies

    def received_one?(item_name)
        if freebies.find_by(item_name: item_name)
            true
        else
            false
        end
    end

    def give_away(dev, freebie)
        freebie.update_column :dev_id, dev.id
    end
end
