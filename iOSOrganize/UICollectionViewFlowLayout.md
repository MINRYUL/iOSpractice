# UICollectionViewFlowLayout

UICollectionViewFlowLayout 클래스를 사용하면 컬렉션뷰의 셀을 원하는 형태로 정렬할 수 있다. 플로우 레이아웃은 레이아웃 객체가 셀을 선형 경로에 배치하고 최대한 이 행을 따라 많은 셀을 채우는것을 의미한다. 현재 행에서 레이아웃 객체의 공간이 부족하면 새로운 행을 생성하고 거기에서 레이아웃 프로세스를 계속 진행한다.

 플로우 레이아웃을 사용해 그리드 형태뿐만 아니라 다양한 레이아웃을 구현할 수 있다. 예를 들어 셀을 하나의 행으로 만들어 정렬한 후 간격을 조정할 수도 있다.

**플로우 레이아웃 구성 단계**

---

1. 플로우 레이아웃 객체를 작성해 컬렉션뷰의 레이아웃 객체로 지정.
2. 셀의 너비와 높이를 구성
3. 필요한 경우 셀의 간격 조절
4. 원할 경우 섹션 헤더 혹은 섹션 푸터의 크기를 지정
5. 레이아웃의 스크롤 방향을 설정

Tip : 플로우 레이아웃은 대부분 프로퍼티의 기본값을 가지고 있다. 하지만 셀의 너비와 높이는 모두 0으로 지정되어 있기 때문에 셀의 크기는 지정해주어야 한다. 그렇지 않을 경우 셀의 너비와 높이의 기본값이 0이기 때문에 셀이 화면에 보이지 않을 수도 있다.

**플로우 레이아웃 속성 변경하기**

---

 플로우 레이아웃 객체는 콘텐츠의 모양을 구성하기 위해 여러 가지 프로퍼티를 제공한다. 이 프로퍼티에 적절한 값을 설정하면 모든 셀에 동일한 레이아웃이 적용된다. 예를 들면 플로우 레이아웃 객체의 itemSize 프로퍼티를 사용하여 셀의 크기를 설정할 경우 모든 셀의 크기가 동일하게 적용된다.

**플로우 레이아웃 셀 크기 지정하기**

---

 컬렉션뷰의 모든 셀이 같은 크기인 경우 플로우 레이아웃 객체의 itemSize의 프로퍼티에 적절한 너비와 높이 값을 할당. 각각의 셀마다 다른 크기를 지정하려면 컬렉션뷰 델리게이트에서 collectionView:layout:sizeForItemAtIndexPath: 메서드를 구현해야 한다. 메서드의 매개변수로 제공하는 인덱스 경로 정보를 사용해 해당 셀의 크기를 반환 가능하다.

Tip: 셀마다 다른 크기를 지정하게 되면 행에 있는 셀의 수는 행마다 달라질 수 있다.

**셀 및 행의 사이 간격 조절하기**

---

 플로우 레이아웃을 사용하여 같은 행의 셀 사이의 최소 간격과 연속하는 행 사이의 최소 간격을 지정할 수 있다. 여기서 명심해야 하는 점은 설정하는 간격은 최소 간격이라는 점이다. 행끼리의 간격은 플로우 레이아웃 객체에서 셀끼리의 간격에서와 같은 방법을 사용한다. 모든 셀의 크기가 같다면 플로우 레이아웃은 행 간격의 최솟값을 절대적으로 수용하며 하나의 행에 있는 모든 셀이 다음 행의 셀과 균등한 간격을 유지할 수 있다.

**콘텐츠 여백 수정하기**

---

 섹션 인셋은 셀을 배치할 때 여백공간을 조절하는 방법의 하나. 인셋을 사용해서 섹션 헤더뷰 다음과 푸터뷰 앞에 공간을 삽입할 수 있다. 또, 콘텐츠의 면 주위에 공간을 삽입할 수도 있다. 인셋은 셀 배치에 있어서 사용가능한 공간을 줄이기 때문에 이를 사용하여 주어진 행의 셀 수를 제한할 수도 있다.

```
let inset = UIEdgeInsetsMake(top, left, botom, right)
```

**셀 예상(Estimated) 크기 지정**

---

 첫 번째 방법은 UICollectionViewFlowLayout 클래스의 itemSize프로퍼티를 이용해 모든 셀을 같은 크기로 설정하는 방법이고, 두 번째 방법은 UICollectionViewDelegateFlowLayout 프로토콜의 collectionView(_:layout:sizeForItemAt:) 메서드를 사용해 셀마다 다른 크기를 지정하는 방법이 있다. 세번째 방법은 셀에 오토레이아웃을 적용하고(앞의 두 가지 방법에도 셀에 오토레이아웃을 적용할 수는 있습니다) 셀 스스로 크기를 결정한 후 이를 UICollectionViewLayout 객체에 알려준다. 이 방법을 사용하려면 estimatedItemSize 프로퍼티를 사용해 대략적인 셀의 최소 크기를 미리 알려준다.

```
let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
flowLayout.estimatedItemSize = CGSize(width: 50.0, height: 50.0)

collectionView.collectionViewLayout = flowLayout
```

**UICollectionViewDelegateFlowLayout**

---

 UICollectionViewDelegateFlowLayout 프로토콜은 UICollectionViewFlowLayout 객체와 상호작용하여 레이아웃을 조정할 수 있는 메서드가 정의되어 있다. 이 프로토콜의 메서드는 셀의 크기와 셀 간의 사이 간격을 정의한다. 이 프로토콜의 메서드는 전부 선택사항이다.

주요 선택 메서드

- collectionView(_:layout:sizeForItemAt:) → CGSize 지정된 셀의 크기를 반환하는 메서드.

```
optional func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
            sizeForItemAt indexPath: IndexPath) -> CGSize
```

- collectionView(_:layout:insetForSectionAt:) -> UIEdgeInsets : 지정된 섹션의 여백을 반환하는 메서드.

```
optional func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   insetForSectionAt section: Int) -> UIEdgeInsets
```

- collectionView(_:layout:minimumLineSpacingForSectionAt:) -> CGFloat : 지정된 섹션의 행 사이 간격 최소 간격을 반환하는 메서드. scrollDirection이 horizontal이면 수직이 행이 되고 vertical이면 수평이 행이 된다.

```
optional func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   minimumLineSpacingForSectionAt section: Int) -> CGFloat
```

- collectionView(_:layout:minimumInteritemSpacingForSectionAt:) -> CGFloat : 지정된 섹션의 셀 사이의 최소간격을 반환하는 메서드.

```
optional func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
```

- collectionView(_:layout:referenceSizeForHeaderInSection:) -> CGSize : 지정된 섹션의 헤더뷰의 크기를 반환하는 메서드. 크기를 지정하지 않으면 화면에 보이지 않습니다.

```
optional func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   referenceSizeForHeaderInSection section: Int) -> CGSize
```

- collectionView(_:layout:referenceSizeForFooterInSection:) -> CGSize : 지정된 섹션의 푸터뷰의 크기를 반환하는 메서드. 크기를 지정하지 않으면 화면에 보이지 않습니다.

```
optional func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   referenceSizeForFooterInSection section: Int) -> CGSize
```