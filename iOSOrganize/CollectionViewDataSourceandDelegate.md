# DataSource and Delegate

**DataSource**

---

 컬렉션뷰 데이터소스 객체는 컬렉션뷰와 관련하여 가장 중요한 객체이며, 필수로 제공해야 한다. 컬렉션뷰의 콘텐츠(데이터)를 관리하고 해당 콘텐츠를 표현하는 데 필요한 뷰를 만든다. 데이터소스 객체를 구현하려면 UICollectionViewDataSource 프로토콜을 준수하는 객체를 만들어야 한다. 그리고 데이터소스 객체는 최소한 collectionView(*:numberOfItemsInSection:)과 collectionView(*:cellForItemAt:) 메서드를 구현해야 하며 나머지 메서드는 선택사항이다.

필수 메서드

- collectionView(_:numberOfItemsInSection:) : 지정된 섹션에 표시할 항목의 개수를 묻는 메서드

```
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
```

- collectionView(_:cellForItemAt:) : 컬렉션뷰의 지정된 위치에 표시할 셀을 요청하는 메서드

주요 선택 메서드

- numberOfSection(in:) : 컬렉션뷰의 섹션의 개수를 묻는 메서드. 이 메서드를 구현하지 않으면 섹션 개수 기본 값은 1.

```
 optional func numberOfSections(in collectionView: UICollectionView) -> Int
```

- collectionView(_:canMoveItemAt:) : 지정된 위치의 항목을 컬렉션뷰의 다른 위치로 이동할 수 있는지를 묻는 메서드.

```
 optional func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool
```

- collectionView(_:moveItemAt:to:) : 지정된 위치의 항목을 다른 위치로 이동하도록 지시하는 메서드.

```
optional func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
```

**델리게이트**

---

- collectionView(_:shouldSelectionItemAt:) : 지정된 셀이 사용자에 의해 선택될 수 있는지를 묻는 메서드. 선택이 가능한 경우 true로 응당하며 아닌 경우는 false로 응답.

```
 optional func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
```

- collectionView(_:didSelectItemAt:) : 지정된 셀이 선택되었음을 알리는 메서드.

```
 optional func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
```

- collectionView(_:shouldDeselectItemAt:) : 지정된 셀의 선택이 해제될 수 있는지 묻는 메서드. 선택 해제가 가능한 경우 `true`로 응답하며, 그렇지 않다면 `false`로 응답.

```
optional func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool
```

- collectionView(_:didDeselectItemAt:) : 지정된 셀의 선택이 해제되었음을 알리는 메서드.

```
 optional func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
```

- collectionView(_:shouldHighlightItemAt:) : 지정된 셀이 강조될 수 있는지 묻는 메서드. 강조해야 하는 경우 `true`로 응답하며, 그렇지 않다면 `false`로 응답.

```
optional func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool
```

- collectionView(_:didHighlightItemAt:) : 지정된 셀이 강조되었을 때 알려주는 메서드.

```
optional func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath)
```

- collectionView(_:didUnhighlightItemAt:) : 지정된 셀이 강조가 해제될 때 알려주는 메서드

```
optional func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath)
```