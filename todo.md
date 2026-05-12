# TripNotes — TODO

## Expense Report System (new feature)
- [ ] Phase 1: Foundation (gems, migrations, settings pages for company rates + default line items)
- [ ] Phase 2: Core expense report CRUD with multi-currency table display
- [ ] Phase 3: CSV import + auto-fetch exchange rates from frankfurter.app
- [ ] Phase 4: PDF generation with Prawn
- [ ] Phase 5: Tests + polish

## Existing Issues
- [ ] Trip `has_many :links` is missing `dependent: :destroy` (causes FK errors on trip deletion)
- [ ] Notes show view references `@note.category` but association is `note_category`
- [ ] NoteCategories has no show template
- [ ] Invoice model permits `:description` in controller but has no description column in DB
- [ ] `income.erb` template should be `income.html.erb`
