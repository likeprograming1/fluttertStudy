아래는 **Provider**, **Notifier**, 그리고 **Navigator**에 대한 설명을 포함한 README 초안입니다. 학습 중인 내용을 기반으로 이해를 돕기 위한 간단한 문서 형식으로 작성했습니다.

---

# **Provider, Notifier, Navigator Study Guide**

안녕하세요! Flutter의 **Provider**, **Notifier**, 그리고 **Navigator**에 대해 공부하며 작성한 README입니다. 이 문서는 각 개념의 목적과 사용법을 간단히 설명합니다.

---

## **1. Provider**

### **Provider란?**

`Provider`는 Flutter에서 상태 관리를 간단하고 효율적으로 구현할 수 있도록 도와주는 패키지입니다. `InheritedWidget`의 사용을 더 편리하게 만들어주는 역할을 하며, **전역 상태 관리**를 쉽게 처리할 수 있습니다.

### **Provider의 주요 개념**

1. **상태 공유**: 앱의 여러 위젯이 동일한 데이터를 공유하도록 설정.
2. **반응형 업데이트**: 상태가 변경되면 연결된 위젯만 자동으로 다시 빌드.
3. **의존성 관리**: 데이터를 의존성 주입(DI) 방식으로 쉽게 전달.

### **사용 예시**

```dart
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // 상태 변경 알림
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Counter(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Provider Example")),
        body: Center(
          child: Consumer<Counter>(
            builder: (context, counter, child) {
              return Text("Count: ${counter.count}");
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<Counter>().increment(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
```

---

## **2. Notifier**

### **Notifier란?**

`Notifier`는 Flutter에서 상태를 반응적으로 관리하기 위한 클래스입니다. `ChangeNotifier`를 확장하여 데이터의 상태 변경을 알리고, 이를 사용하는 위젯들이 업데이트되도록 합니다.

### **Notifier와 Provider**

`Notifier`는 단독으로 사용하기보다는 **Provider**와 함께 사용하는 경우가 많습니다. `ChangeNotifierProvider`를 통해 `Notifier` 상태를 쉽게 연결할 수 있습니다.

### **사용 예시**

```dart
class CounterNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // 상태 변경 알림
  }
}
```

Provider와 함께 사용:

```dart
ChangeNotifierProvider(
  create: (_) => CounterNotifier(),
  child: MyApp(),
);
```

---

## **3. Navigator**

### **Navigator란?**

`Navigator`는 Flutter의 내장 라우팅 시스템으로, **화면 이동과 스택 관리**를 담당합니다. Flutter 앱에서 페이지를 이동하거나 뒤로 가는 동작을 구현할 때 사용됩니다.

### **Navigator의 주요 기능**

1. **화면 이동(Push)**: 새로운 페이지를 스택에 추가.
2. **화면 닫기(Pop)**: 현재 페이지를 스택에서 제거하고 이전 페이지로 돌아감.
3. **스택 관리**: 페이지를 스택 구조로 관리하여 이동 경로를 추적.

### **사용 예시**

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondPage()),
);

// 뒤로 가기
Navigator.pop(context);
```

### **Navigator 2.0**

`Navigator 2.0`은 선언형 라우팅을 지원하며, URL과 앱 상태를 동기화할 수 있습니다. `go_router`와 같은 라우팅 라이브러리에서 이를 활용합니다.

---

## **Provider, Notifier, Navigator의 관계**

- **Provider와 Notifier**: `Notifier`는 상태 변경을 관리하며, `Provider`는 이를 앱의 위젯 트리에 쉽게 전달하는 역할을 합니다.
- **Navigator와 상태 관리**: 화면 전환 시 `Provider`와 `Notifier`를 사용하여 상태를 공유하고 관리할 수 있습니다.

---

## **결론**

- **Provider**: 전역 상태를 관리하고 위젯에 전달.
- **Notifier**: 상태를 변경하고 알리는 역할.
- **Navigator**: 페이지 전환과 화면 스택을 관리.
