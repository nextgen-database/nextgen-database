class AddSdgParamValueToSearchProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :search_profiles, :search_profile_sdg_param, :integer, default: 0
  end
end
