# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Translation.create(
   locale: "en",
   key: "rps.test-rp.name",
   value: "register for an identity profile"
)

Translation.create(
    locale: "en",
    key: "rps.test-rp.rp_name",
    value: "Test RP No Demo"
)

Translation.create(
    locale: "en",
    key: "rps.test-rp.analytics_description",
    value: "TEST RP NO DEMO"
)

Translation.create(
    locale: "en",
    key: "rps.test-rp.other_ways_description",
    value: "register for an identity profile"
)

# Translation.create(
#     locale: "en",
#     key: "rps.test-rp.",
#     value: ""
# )

Translation.create(
    locale: "en",
    key: "rps.test-rp.tailored_text",
    value: "<p>En This is tailored text for TEST RP NO DEMO</p>"
)

Translation.create(
    locale: "cy",
    key: "rps.test-rp.name",
    value: "register for an identity profile"
)

Translation.create(
    locale: "cy",
    key: "rps.test-rp.rp_name",
    value: "Test RP No Demo"
)

Translation.create(
    locale: "cy",
    key: "rps.test-rp.analytics_description",
    value: "TEST RP NO DEMO"
)

Translation.create(
    locale: "cy",
    key: "rps.test-rp.other_ways_description",
    value: "register for an identity profile"
)

Translation.create(
    locale: "cy",
    key: "rps.test-rp.tailored_text",
    value: "<p>Cy This is tailored text for TEST RP NO DEMO</p>"
)