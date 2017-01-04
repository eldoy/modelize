# # # # # # # # #
# Patch the Mongo::Collection::View class to return documents as models
# If you query the :models collection, if a Model class exists
# and the setting Minimongo.enable = true
#
# Set Minimongo.modules = 'Fu::Models' if your models is inside a module,
# default module is root '::'
#

module Mongo
  class Collection
    class View

      # To a BSON::Documents or models
      def to_a
        Modelize.enable ? super.map{|doc| modelize(doc)} : super
      end

      # First BSON::Document or model
      def first
        Modelize.enable ? modelize(super) : super
      end

      private

      # Get the model class, BSON::Document if it doesn't exist
      def modelize(doc)
        Object.const_get("#{Modelize.module}::#{self.collection.name[0..-2].capitalize}").include(::Modelize::Core).new.tap{|m| m.doc = doc} rescue doc
      end

    end
  end
end

