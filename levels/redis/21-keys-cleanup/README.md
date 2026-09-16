# a migration left a temporary key behind — remove it
The import job writes scratch data under keys starting with `tmp:` and normally cleans up after
itself. Last night it didn't, and nobody wrote down the full key name. Find whatever is left
under the `tmp:` prefix and delete it. Don't touch any other key.
