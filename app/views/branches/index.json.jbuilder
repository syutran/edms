json.array!(@branches) do |branch|
  json.extract! branch, :id, :branchname, :coding, :parent_id, :status
  json.url branch_url(branch, format: :json)
end
