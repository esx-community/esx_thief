resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX THIEF'

version '1.0.2'

client_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'locales/sv.lua',
  'locales/pl.lua',
  'config.lua',
  'client/main.lua',
  'handsup.lua'
}

server_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'locales/sv.lua',
  'locales/pl.lua',
  'config.lua',
  'server/main.lua'
}
