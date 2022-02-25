# Editable Areas

[![Build Status](https://travis-ci.org/kainage/editable_areas.png)](https://travis-ci.org/kainage/editable_areas)

Requires ruby >= **v2.0** 
Requires rails >= **v4.0.0**

Renders text or an editor anywhere in your rails 4 application

## Installation

Add this line to your application's Gemfile:

    gem 'editable_areas'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install editable_areas

Run the generator:

    $ rails g editable_areas

This will create the migration file.

Migrate the database:

    $ rake db:migrate

## Usage

Add one of the helper methods to one of your pages:

```
<%= render_or_edit_area_with_button('Title' accessible: true) %>
```

Title is the unique identifier for the text area. This can be whatever you want.

The accessible option will hide the edit button and never render the editable form
(will always render the content) if false. Pass in an _admin_ or _moderator_ etc.
check here.

You will now have a blank div with the class "editable_area" and an edit button.
Clicking on the edit button will return you to the same page, but there will be a
textarea for you to edit.

Submitting the form will return you to the same page with the content loaded and
the edit button back in place (if accessible)

Note that even if an unauthorized user appends _?edit=true_ to the url, it will
not render the form unless ```accessible = true```

If you want to render the form/content and the button separately you can:

```
<%= render_or_edit_area('Title', accessible: true) %> # Renders only the content or form

<%= render_edit_area_button(accessible: true) %> # Renders only the edit button
```

By default the textarea has a class of "ckeditor" if you want to hook into that
or you use the _ckeditor-rails_ gem. If not, you can just ignore this.

### CanCan integration

If you are using CanCan for authorization, the ```EditableAreasController``` will
automatically add authorization to the _update_ action with ```authorize! :update, @editable_area```.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
