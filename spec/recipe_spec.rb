describe(Recipe) do
  it { should have_and_belong_to_many (:ingredients) }
end

describe(Recipe) do
  it { should_have_and_belong_to_many (:categories) }
end
