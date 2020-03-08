import React from "react";

const Select = ({
  selection,
  items,
  onChange
}) => (
  <select
    onChange={onChange}
    defaultValue={selection}
    name={name}
  >
    <option value="">Select a story</option>
    {items.map((item) => (
      <option
        value={item.value}
        key={item.value}
      >{item.label}</option>
    ))}
  </select>
);

class MultiSelect extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      selections: this.props.selections,
    };

    this.addSelection = this.addSelection.bind(this);
    this.addSelect = this.addSelect.bind(this);
  }

  addSelection(e) {
    const selectedItem = e.target.value;
    if (!this.state.selections.includes(selectedItem)) {
      this.setState((state) => {
        const selections = state.selections.filter(selection => selection.value != '');
        return {
          selections: [
            selectedItem,
            ...selections,
          ]
        }
      });
    }
  }

  addSelect(e) {
    e.preventDefault();
    this.setState((state) => ({
      selections: [
        ...state.selections,
        '',
      ],
    }));
  }

  render() {
    const { selections } = this.state;
    const { items, id, name } = this.props;
    const selectionIds = selections.filter(selection => selection !== '');
    return (
      <div>
        { selections.map((selection) => (
          <div key={selection.value}>
            <Select
              selection={selection}
              items={items}
              name={name}
              onChange={this.addSelection}
            />
          </div>
        ))}
        <div>
          <button
            onClick={this.addSelect}
          >
            Add another
          </button>
        </div>
      </div>
    );
  }
}

export default MultiSelect
