module Slug

    def set_slug
        self.slug = self.name.parameterize
    end
end
