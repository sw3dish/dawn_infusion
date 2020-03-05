import React from 'react';

import MultiSelect from './MultiSelect';

const StoriesMultiSelect = ({newsletterStories = [], stories = []}) => {
  const items = stories.map((story) => ({
    value: story.id,
    label: story.title,
  }));

  const selections = newsletterStories.map((story) => story.id);

  return (
    <MultiSelect
      items={items}
      selections={selections}
      name="newsletter[story_id][]"
      id="newsletter_story_id"
    />
  )
}

export default StoriesMultiSelect;
