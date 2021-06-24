module Slug

    def set_slug
        if self[:name]
            self.slug = self.name.parameterize
        elsif self[:username]
            self.slug = self.username.parameterize
        end
    end
end
