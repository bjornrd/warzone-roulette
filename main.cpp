#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QStyleHints>
#include <QQmlContext>


int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);
    app.styleHints()->setMousePressAndHoldInterval(250);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/WarzoneRoulette/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.rootContext()->setContextProperty("qtversion", QString(qVersion()));
    engine.load(url);

    return app.exec();
}
