/****************************************************************************
 **
 ** Copyright (C) 2016 The Qt Company Ltd.
 ** Contact: https://www.qt.io/licensing/
 **
 ** This file is part of the documentation of the Qt Toolkit.
 **
 ** $QT_BEGIN_LICENSE:BSD$
 ** Commercial License Usage
 ** Licensees holding valid commercial Qt licenses may use this file in
 ** accordance with the commercial license agreement provided with the
 ** Software or, alternatively, in accordance with the terms contained in
 ** a written agreement between you and The Qt Company. For licensing terms
 ** and conditions see https://www.qt.io/terms-conditions. For further
 ** information use the contact form at https://www.qt.io/contact-us.
 **
 ** BSD License Usage
 ** Alternatively, you may use this file under the terms of the BSD license
 ** as follows:
 **
 ** "Redistribution and use in source and binary forms, with or without
 ** modification, are permitted provided that the following conditions are
 ** met:
 **   * Redistributions of source code must retain the above copyright
 **     notice, this list of conditions and the following disclaimer.
 **   * Redistributions in binary form must reproduce the above copyright
 **     notice, this list of conditions and the following disclaimer in
 **     the documentation and/or other materials provided with the
 **     distribution.
 **   * Neither the name of The Qt Company Ltd nor the names of its
 **     contributors may be used to endorse or promote products derived
 **     from this software without specific prior written permission.
 **
 **
 ** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 ** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 ** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 ** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 ** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 ** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 ** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 ** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 ** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 ** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 ** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
 **
 ** $QT_END_LICENSE$
 **
 ****************************************************************************/

#include <graphics/openglwindow.h>

#include <QtGui/QGuiApplication>
#include <QtGui/QMatrix4x4>
#include <QtGui/QOpenGLShaderProgram>
#include <QtGui/QScreen>

#include <QtCore/qmath.h>
#include <QtCore/qfile.h>
#include <QtCore/qfileinfo.h>

#include <QOpenGLTexture>
#include <QCommandLineParser>

#include <FreeImage.h>

#include <cstdio>
#include <iostream>

#include <sstream>
#include <iomanip>


#define NUM_TEXTURES 4

class ViewerWindow : public OpenGLWindow
{
public:
	//ViewerWindow();
	ViewerWindow(const char* backgroundPath, const char* irpvPath, const char* irPath, const char* alphaPath);

	void initialize() override;
	void render() override;

private:
	void loadTexture(const char *filename, int slot);

	GLuint m_posAttr;
	GLuint m_colAttr;
	GLuint m_texcAttr;
	GLuint m_matrixUniform;

	const char* m_backgroundPath;
	const char* m_irpvPath;
	const char* m_irPath;
	const char* m_alphaPath;

	QOpenGLShaderProgram *m_program;	
	QOpenGLTexture		 *m_texture[NUM_TEXTURES];
	int m_frame;
};

/*ViewerWindow::ViewerWindow()
	: m_program(0)
	, m_frame(0)
{
	m_backgroundPath = "E:/Dan/Projects/synthetizen/resources/images/0000_ini.png";
	m_irpvPath = "E:/Dan/Projects/synthetizen/resources/images/0000_irpv.png";
	m_irPath = "E:/Dan/Projects/synthetizen/resources/images/0000_ir.png";
	m_alphaPath = "E:/Dan/Projects/synthetizen/resources/images/0000_alpha.png";
}*/


ViewerWindow::ViewerWindow
	(const char* backgroundPath,
	const char* irpvPath,
	const char* irPath,
	const char* alphaPath)
	: m_program(0)
	, m_frame(0)
{
	m_backgroundPath = backgroundPath;
	m_irpvPath = irpvPath;
	m_irPath = irPath;
	m_alphaPath = alphaPath;
}


void ViewerWindow::loadTexture(const char *filename, int slot)
{
	FREE_IMAGE_FORMAT format = FreeImage_GetFileType(filename, 0);//Automatocally detects the format(from over 20 formats!)
	bool isEXR = ((format == FIF_SGI/*Octane EXR*/) || (format == FIF_EXR));
	//std::cout << "The image format is: " << format << std::endl;

	if (!isEXR)
	{
		// simple case with png texture supported by QImage
		//m_texture = new QOpenGLTexture(QImage(QString(":/images/andromeda.png")).mirrored());
		m_texture[slot] = new QOpenGLTexture(QImage(filename).mirrored());
	}
	else {
		// find the buffer format
		//FREE_IMAGE_FORMAT format = FreeImage_GetFileType(filename, 0);//Automatocally detects the format(from over 20 formats!)
		FIBITMAP* image = FreeImage_Load(format, filename);

		// translate from FreeImage to QImage:
		// https://github.com/zoon/FreeImage-Plugin-for-QT4/blob/master/FreeImageHandler.cpp
		int w = FreeImage_GetWidth(image);
		int h = FreeImage_GetHeight(image);
		std::cout << "The size of the image is: " << "(" << format << ")" << w << " * " << h << std::endl; //Some debugging code

		// standard bitmap type																												
		WORD bpp = FreeImage_GetBPP(image);
		std::cout << "The image is BPP: " << bpp << std::endl;

		m_texture[slot] = new QOpenGLTexture(QOpenGLTexture::Target2D);
		m_texture[slot]->setSize(w, h);
		
		QOpenGLTexture::TextureFormat pxintformat;
		QOpenGLTexture::PixelFormat pxformat;
		QOpenGLTexture::PixelType pxtype; 		
		switch (bpp)
		{
			case(128):
			{			// Float - 128 bpp // bitmap type 28
				pxintformat = QOpenGLTexture::TextureFormat::RGBA16_UNorm;
				pxformat = QOpenGLTexture::PixelFormat::RGBA;
				pxtype = QOpenGLTexture::PixelType::Float32;
			} break;
			case(96):
			{			// RGB 
				pxintformat = QOpenGLTexture::TextureFormat::RGBA16_UNorm; /*RGBA8_UNorm*/
				pxformat = QOpenGLTexture::PixelFormat::RGB;
				pxtype = QOpenGLTexture::PixelType::Float32;
			} break;
			case(32):
			{ 		// Depth
				pxintformat = QOpenGLTexture::TextureFormat::RGBA16_UNorm;
				pxformat = QOpenGLTexture::PixelFormat::Luminance;
				pxtype = QOpenGLTexture::PixelType::Float32;
			} break;
			case(24):
			{ 		// RGB 24bit (8bit/channel)
				pxintformat = QOpenGLTexture::TextureFormat::RGBA16_UNorm;
				pxformat = QOpenGLTexture::PixelFormat::RGB;
				pxtype = QOpenGLTexture::PixelType::UInt8;
			} break;
			default: // didn't solve the stuck 4th image problem // left it as failproof
			{
				pxintformat = QOpenGLTexture::TextureFormat::RGBA16_UNorm;
				pxformat = QOpenGLTexture::PixelFormat::RGB;
				pxtype = QOpenGLTexture::PixelType::Float32;
			} break;
		}
		m_texture[slot]->setFormat(pxintformat); // internal format
		m_texture[slot]->allocateStorage(pxformat, pxtype); // format & type

		// Saves EXR image with same formato
		// FreeImage_Save(format, image, "output.exr", 0);

		//GLubyte* texture = new GLubyte[4 * w*h];
		//char* pixels = (char*)FreeImage_GetBits(imagen);

		//GLfloat* texture = new GLfloat[3 * w*h];
		GLfloat* texture = new GLfloat[4 * w*h];
		GLfloat* depth; if (bpp == 32) depth = new GLfloat[w*h];

		//GLubyte* texture = new GLubyte[3 * w*h];

		/*
		FIBITMAP* tonemapped_image = FreeImage_TmoDrago03(image, 2.2f, 0.f);
		w = FreeImage_GetWidth(tonemapped_image);
		h = FreeImage_GetHeight(tonemapped_image);
		bpp = FreeImage_GetBPP(tonemapped_image);
		std::cout << "The tonemapped_image is BPP: " << bpp << std::endl;
		std::cout << "The size of the tonemapped_image is: " << "(" << format << ")" << w << " * " << h << std::endl; //Some debugging code
		*/

		GLfloat* pixels = (GLfloat*)FreeImage_GetBits(image);
		//char* pixels = (char*)FreeImage_GetBits(tonemapped_image);

		//FreeImage loads in BGR format, so you need to swap some bytes(Or use GL_BGR).
		//std::cout << "The uchar image starts ... : " << pixeles[0] << std::endl; //Some debugging code

		for (size_t j = 0; j < w*h; j++)
		{
			//		std::cout << "j = " << j << std::endl;
	/*
			texture[j * 4 + 0] = pixels[j * 3 + 2]; // GLubyte(255);
			texture[j * 4 + 1] = pixels[j * 3 + 1]; // GLubyte(0);
			texture[j * 4 + 2] = pixels[j * 3 + 0]; // GLubyte(0);
			texture[j * 4 + 3] = 0; 			    // GLubyte(255);
	*/
			if (bpp != 32) {
				/*texture[j * 3 + 0] = pixels[j * 3 + 0];
				texture[j * 3 + 1] = pixels[j * 3 + 1];
				texture[j * 3 + 2] = pixels[j * 3 + 2];*/


				texture[j * 4 + 0] = pixels[j * 4 + 0];
				texture[j * 4 + 1] = pixels[j * 4 + 1];
				texture[j * 4 + 2] = pixels[j * 4 + 2];
				texture[j * 4 + 3] = pixels[j * 4 + 3];
			}
			else {
				depth[j] = pixels[j];
			}
			//		texture[j * 4 + 3] = 1.f;

			//		std::cout<< j <<": "<<(int)textura[j*4+0]
			//					  <<"**"<<(int)textura[j*4+1]
			//					  <<"**"<<(int)textura[j*4+2]
			//					  <<"**"<<(int)textura[j*4+3]<<std::endl;
		}

		m_texture[slot]->setData(pxformat, pxtype, (GLvoid*) (bpp != 32) ? texture : depth);
	}

	m_program->bind();
	m_program->setUniformValue("texture", 0);
	m_program->setUniformValue("IRPV", 1);
	m_program->setUniformValue("IR", 2);
	m_program->setUniformValue("Alpha", 3);
}

void ViewerWindow::initialize()
{
	m_program = new QOpenGLShaderProgram(this);
	m_program->addShaderFromSourceFile(QOpenGLShader::Vertex, ":/shaders/default.vp");
	m_program->addShaderFromSourceFile(QOpenGLShader::Fragment, ":/shaders/texture.fp");
	m_program->link();
	m_posAttr = m_program->attributeLocation("posAttr");
//	m_colAttr = m_program->attributeLocation("colAttr");
	m_texcAttr = m_program->attributeLocation("texcAttr");
	m_matrixUniform = m_program->uniformLocation("matrix");

	std::cout << "Loading Bg" << std::endl;
	loadTexture(m_backgroundPath, 0);
	std::cout << "Loading irpv" << std::endl;
	loadTexture(m_irpvPath, 1);
	std::cout << "Loading ir" << std::endl;
	loadTexture(m_irPath, 2);
	std::cout << "Loading Alpha" << std::endl;
	loadTexture(m_alphaPath, 3);
}

void ViewerWindow::render()
{
	const qreal retinaScale = devicePixelRatio();
	glViewport(0, 0, width() * retinaScale, height() * retinaScale);

	glClear(GL_COLOR_BUFFER_BIT);

	m_program->bind();

	QMatrix4x4 matrix;
	matrix.ortho(-1.f, 1.f, -1.f, 1.f, 0.f, 1.f);
	matrix.translate(0, 0, 0);

	m_program->setUniformValue(m_matrixUniform, matrix);

	GLfloat vertices[] = {
		-1.0f, -1.0f,
		-1.0f,  1.0f,
		 1.0f,  1.0f,
		 1.0f, -1.0f
	};

	GLfloat tex_coords[] = {
		0, 0,
		0, 1,
		1, 1,
		1, 0
	};

	glVertexAttribPointer(m_posAttr, 2, GL_FLOAT, GL_FALSE, 0, vertices);
	glVertexAttribPointer(m_texcAttr, 2, GL_FLOAT, GL_FALSE, 0, tex_coords);

	glEnableVertexAttribArray(0);
	glEnableVertexAttribArray(1);

	for (uint i=0; i<NUM_TEXTURES; i++)
		m_texture[i]->bind(i, QOpenGLTexture::TextureUnitReset::ResetTextureUnit);

	glDrawArrays(GL_QUADS, 0, 4);

	glDisableVertexAttribArray(1);
	glDisableVertexAttribArray(0);

	m_program->release();

	++m_frame;

	// std::cout << m_frame << " ";
}


/* TODO:
Investigar Qt para ver donde se puede llamar al guardado
Evitar que haga render indefinidamente -> (1 render y salga ?)
*/

int main(int argc, char **argv)
{
	QGuiApplication app(argc, argv);

	QCommandLineParser parser;

	QCommandLineOption backgroundOpt("bg",
		QCoreApplication::translate("main", "Background of the composition"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(backgroundOpt);
	//std::cout << "BG Read" << std::endl;

	QCommandLineOption irpvOpt("irpv",
		QCoreApplication::translate("main", "Full render of the virtual part of the composition"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(irpvOpt);
	//std::cout << "Irpv Read" << std::endl;

	QCommandLineOption irOpt("ir",
		QCoreApplication::translate("main", "Render of the floor of the composition"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(irOpt);
	//std::cout << "Ir Read" << std::endl;

	QCommandLineOption alphaOpt("a",
		QCoreApplication::translate("main", "Alpha map of the composition"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(alphaOpt);
	//std::cout << "Alpha Read" << std::endl;

	parser.process(app);

	QString qBackgroundPath = parser.value(backgroundOpt);
	std::string strBackgroundPath = qBackgroundPath.toUtf8().constData();
	const char* backgroundPath = strBackgroundPath.c_str();
	//std::cout << "BG Converted: " << backgroundPath << std::endl;

	QString qIrpvPath = parser.value(irpvOpt);
	std::string strIrpvPath = qIrpvPath.toUtf8().constData();
	const char* irpvPath = strIrpvPath.c_str();
	//std::cout << "Irpv Converted: " << irpvPath << std::endl;

	QString qIrPath = parser.value(irOpt);
	std::string strIrPath = qIrPath.toUtf8().constData();
	const char* irPath = strIrPath.c_str();
	//std::cout << "Ir Converted: " << irPath << std::endl;

	QString qAlphaPath = parser.value(alphaOpt);
	std::string strAlphaPath = qAlphaPath.toUtf8().constData();
	const char* alphaPath = strAlphaPath.c_str();
	//std::cout << "Alpha Converted: " << alphaPath << std::endl;


	QSurfaceFormat format;
	format.setSamples(16);

	std::cout << "Creating composition with paths: "<< std::endl 
		<< backgroundPath << std::endl
		<< irpvPath << std::endl 
		<< irPath << std::endl 
		<< alphaPath << std::endl;

	ViewerWindow window(backgroundPath, irpvPath, irPath, alphaPath);
	window.setFormat(format);
	window.resize(640, 480);
	window.show();
	
	window.setAnimating(true);
	
	// Loading and composition starts now
	return app.exec();

	// This is after main loop
}