
  
  
---
# NavigationSplitSideBarView SwiftStarterApp/NavigationSplitViews/NavigationSplitSideBarView.swift
## Imported Code Object
The `NavigationSplitSideBarView` is a SwiftUI view that represents the sidebar or navigation pane in a split view interface. It's designed to work with the `NavigationSplitView` container, which provides a split view layout with a sidebar and a detail area.

In this code snippet, `NavigationSplitSideBarView` is a struct that conforms to the `View` protocol, making it a SwiftUI view. It has two `@Binding` properties: `selectedItem` and `route`, which allow for two-way data binding with other views or view models.

The view contains two dictionaries: `dataFolders` and `dataFolders2`, which store the hierarchical data to be displayed in the sidebar.

The `columnSize` property is a computed property that determines the width of the sidebar column based on the device type (iPad or other).

The `body` property, which is a requirement for all SwiftUI views, defines the user interface of the sidebar. It consists of a `VStack` containing a `List` and a `Text` view.

The `List` displays two sections: "Data and Storage" and "Views". Each section contains a `ForEach` loop that iterates over the keys (folders) of the corresponding dictionary and creates a `NavigationLink` for each folder. The `NavigationLink` is associated with a `NavigationSplitRoute` value, which encapsulates the folder title and an array of its contents.

When a user taps on a `NavigationLink`, the `NavigationSplitView` will update its detail area to display the contents of the selected folder.

The `List` also sets some styling properties, such as the accent color for the disclosure indicators and padding.

Finally, the view sets some navigation-related properties, such as the title, toolbar background color, and the column width for the split view layout.

Overall, the `NavigationSplitSideBarView` is responsible for rendering the sidebar content and handling navigation within the `NavigationSplitView` layout.

  
  