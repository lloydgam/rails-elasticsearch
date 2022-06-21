require 'elasticsearch/model'

class MbsItem < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  index_name Rails.application.class.parent_name.underscore
  document_type self.name.downcase

  settings index: {number_of_shards: 1} do
    mapping dynamic: 'false' do
      indexes :reference, anlyzer: 'english'
      indexes :description, analyzer: 'english'
    end
  end

  def as_indexed_json(options = nil)
    self.as_json( only: [:reference, :description], methods: :method_name)
  end

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['reference', 'description']
          }
        }
      }
    )
  end
end
