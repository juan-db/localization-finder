# Localization Finder
Localization Finder a simple Bash script that finds all localization strings that are missing text in an ASP.NET Boilerplate project.

The script recursively searched the first directory specified for any localization names within TypeScript or HTML files. It then searches for these names in the localization files within the second directory specified. If none of the localization files contain the current name, it counts that missing name and gives you a message with the localization name and the file where that name is mentioned.

Names are not distinct, i.e. a localization name may occur twice if it is mentioned in more than one place. This is so that you can see the files where the name exists and can gain some context on how it is used.

# Usage
./localization.sh (angular sources directory) (localization file directory)
