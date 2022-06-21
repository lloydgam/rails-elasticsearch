require 'elasticsearch/model'

class MbsItem < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  index_name "mbs"
  document_type "mbs_items"

  settings index: {number_of_shards: 1} do
    mapping dynamic: 'false' do
      indexes :reference, anlyzer: 'english'
      indexes :description, analyzer: 'english'
    end
  end

  def as_indexed_json(options = nil)
    self.as_json( only: [:reference, :description])
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
