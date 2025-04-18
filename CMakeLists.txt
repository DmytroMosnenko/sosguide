cmake_minimum_required(VERSION 3.16)

project(SOSGuide VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(SOSGuide
    qml.qrc
    main.cpp
    appmanager.cpp
)

qt_add_qml_module(SOSGuide
    URI com.sosguide
    VERSION 1.0
    QML_FILES
            RESOURCES qml.qrc
            RESOURCES icons.qrc
            SOURCES appmanager.h
            SOURCES backbuttonfilter.h backbuttonfilter.cpp
            SOURCES emergencycallhelper.h emergencycallhelper.cpp
            SOURCES offlinetranslator.h offlinetranslator.cpp
            SOURCES localizationhelper.h localizationhelper.cpp
            SOURCES admobhelper.h admobhelper.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(SOSGuide PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.SOSGuide
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
    QT_ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_SOURCE_DIR}/android"
)

target_link_libraries(SOSGuide
    PRIVATE Qt6::Quick
)

# include(GNUInstallDirs)
# install(TARGETS SOSGuide
#     BUNDLE DESTINATION .
#     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
#     RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
# )
