class Company < ActiveRecord::Base
    has_many :freebies, dependent: :destroy
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        Freebie.create(item_name: item_name, value: value, dev_id: dev.id, company_id: self.id)
    end

    def self.oldest_company
        all.sort_by {|company| company.founding_year}.first
    end
end
