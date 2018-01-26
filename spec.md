# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Organization has_many Contacts)
- [x] Include at least one belongs_to relationship (Contact belongs_to Organization)
- [x] Include at least one has_many through relationship (User has_many Organizations, through Events)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (event.date, event.name)
- [x] Include reasonable validations for simple model objects (Validates presence of user name and date, Validates uniqueness of Organization name)
- [x] Include a class level ActiveRecord scope method (User.follow_up_events , listed on Users#show)
- [x] Include a nested form writing to an associated model using a custom attribute writer (Event form at events_path nests organization and contacts.  Custom contacts_attibutes= at Organization model)
- [x] Include signup (Devise)
- [x] Include login (Devise)
- [x] Include logout (Devise)
- [x] Include third party signup/login (Devise/OmniAuth through Github)
- [x] Include nested resource show or index (/organizations/1/contacts/1/edit)
- [x] Include nested resource "new" form (/organizations/1/contacts/new)
- [x] Include form display of validation errors (/events/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
