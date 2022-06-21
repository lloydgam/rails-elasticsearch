Elasticsearch::Model.client = Elasticsearch::Client.new({
  host: "https://elastic:#{ENV["ELASTICSEARCH_PASSWORD"]}@localhost:9200",
  transport_options: { ssl: { ca_file: "#{Rails.root.join('certs')}/http_ca.crt"} },
  log: true
})