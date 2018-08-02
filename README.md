# localization-finder
This is a simple Bash script that finds all localization strings that are missing text in an ASP.NET Boilerplate project.

It recursively searches the specified directory that contains your Angular source files for any localization names.
It matches those against the names that are present in the specified localization file.
If the name is not present in the localization file it will give you a message indicating the name of the localization and the file where the name is mentioned.

Names are not distinct, i.e. a localization name may occur twice if it is mentioned in more than one place. This is so that you can see the files where the name exists and can gain some context on how it is used.

# Usage
./localization.sh (directory that contains your angular source files) (path to your localization file)
