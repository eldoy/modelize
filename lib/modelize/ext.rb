# # # # # # # # #
# Patch the Mongo::Collection::View class to return documents as models
# If you query the :models collection, if a Model class exists
# and the setting Minimongo.model = true
#
# Set Minimongo.modules = 'Fu::Models' if your models is inside a module,
# default module is root '::'
#

module Mongo
  class Collection
    class View

      # To a BSON::Documents or models
      def to_a
        Modelize.enable ? super.map{|d| modelize(d)} : super
      end

      # First BSON::Document or model
      def first
        Modelize.enable ? modelize(super) : super
      end

      private

      # Get the model class, BSON::Document if it doesn't exist
      def modelize(d)
        m = Object.const_get("#{Modelize.module}::#{self.collection.name[0..-2].capitalize}")
        m.include ::Modelize::Core
        m.new(d)
      end

    end
  end
end

