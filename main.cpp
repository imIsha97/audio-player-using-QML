#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QAudioDeviceInfo>
#include <QDebug>

int main(int argc, char *argv[])
{

//    const auto deviceInfos = QAudioDeviceInfo::availableDevices(QAudio::AudioOutput);
//    for (const QAudioDeviceInfo &deviceInfo : deviceInfos)
//        qDebug() << "Device name: " << deviceInfo.deviceName();
//    QAudioDeviceInfo audioinfo;
//    QStringList mulist = audioinfo.supportedCodecs();
//      for (const QAudioDeviceInfo &audioinfo)
//          qDebug() << mulist;
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
   // qDebug("Supported Audio list is" , QAudioDeviceInfo::supportedCodecs())

    return app.exec();
}
