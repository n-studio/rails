*   Add support for multiple databases for Action Text.

    `config.action_text.connects_to = { database: { writing: :primary, reading: :primary_replica } }`

    *Matthew Nguyen*

*   Dispatch direct-upload events on attachment uploads

    When using Action Text's rich textarea,  it's possible to attach files to the
    editor. Previously, that action didn't dispatch any events, which made it hard
    to react to the file uploads. For instance, if an upload failed, there was no
    way to notify the user about it, or remove the attachment from the editor.

    This commits adds new events - `direct-upload:start`, `direct-upload:progress`,
    and `direct-upload:end` - similar to how Active Storage's direct uploads work.

    *Matheus Richard*, *Brad Rees*

*   Add `store_if_blank` option to `has_rich_text`

    Pass `store_if_blank: false` to not create `ActionText::RichText` records when saving with a blank attribute, such as from an optional form parameter.

    ```ruby
    class Message
      has_rich_text :content, store_if_blank: false
    end

    Message.create(content: "hi") # creates an ActionText::RichText
    Message.create(content: "") # does not create an ActionText::RichText
    ```

    *Alex Ghiculescu*

*   Strip `content` attribute if the key is present but the value is empty

    *Jeremy Green*

*   Rename `rich_text_area` methods into `rich_textarea`

    Old names are still available as aliases.

    *Sean Doyle*

*   Only sanitize `content` attribute when present in attachments.

    *Petrik de Heus*

Please check [7-2-stable](https://github.com/rails/rails/blob/7-2-stable/actiontext/CHANGELOG.md) for previous changes.
