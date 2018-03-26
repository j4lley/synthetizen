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

class ViewerWindow : public OpenGLWindow
{
public:
	ViewerWindow();
	ViewerWindow(const char* tex_path, const char* tex_A_path, const char* tex_B_path);

	void initialize() override;
	void render() override;

private:
	void loadTexture(const char *filename, int slot);

	GLuint m_posAttr;
	GLuint m_colAttr;
	GLuint m_texcAttr;
	GLuint m_matrixUniform;

	const char* m_tex_path;
	const char* m_tex_A_path;
	const char* m_tex_B_path;

	QOpenGLShaderProgram *m_program;
	QOpenGLTexture		 *m_texture[3];
	int m_frame;
};

ViewerWindow::ViewerWindow()
	: m_program(0)
	, m_frame(0)
{
	// DO NOT PLEASE EVER CHANGE THIS TO AN ABSOLUTE PATH !!!
	m_tex_path = "../../../resources/images/frame_rgb.exr";
	m_tex_A_path = "../../../resources/images/frame_depth.exr";
	m_tex_B_path = "../../../resources/images/frame_ss.png";
	// DO NOT PLEASE EVER CHANGE THIS TO AN ABSOLUTE PATH !!!
}

ViewerWindow::ViewerWindow
	(const char* tex_path,
	const char* tex_A_path,
	const char* tex_B_path)
	: m_program(0)
	, m_frame(0)
{
	m_tex_path = tex_path;
	m_tex_A_path = tex_A_path;
	m_tex_B_path = tex_B_path;
}

int main(int argc, char **argv)
{
	QGuiApplication app(argc, argv);


	QCommandLineParser parser;

	QCommandLineOption texOpt("t",
		QCoreApplication::translate("main", "texture"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(texOpt);

	QCommandLineOption texAOpt("ta",
		QCoreApplication::translate("main", "texture A"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(texAOpt);

	QCommandLineOption texBOpt("tb",
		QCoreApplication::translate("main", "texture B"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(texBOpt);


	parser.process(app);

	QString qTexPath = parser.value(texOpt);
	std::string strTexPath = qTexPath.toUtf8().constData();
	const char* texPath = strTexPath.c_str();

	QString qTexAPath = parser.value(texAOpt);
	std::string strTexAPath = qTexAPath.toUtf8().constData();
	const char* texAPath = strTexAPath.c_str();

	QString qTexBPath = parser.value(texBOpt);
	std::string strTexBPath = qTexBPath.toUtf8().constData();
	const char* texBPath = strTexBPath.c_str();
	

	QSurfaceFormat format;
	format.setSamples(16);

	ViewerWindow window;
	window.setFormat(format);
	window.resize(640, 480);
	window.show();

	window.setAnimating(true);

	return app.exec();
}

void ViewerWindow::loadTexture(const char *filename, int slot)
{
	FREE_IMAGE_FORMAT format = FreeImage_GetFileType(filename, 0);//Automatocally detects the format(from over 20 formats!)
	printf("File path: %s \n", filename);
	bool isEXR = ((format == FIF_SGI/*Octane EXR*/) || (format == FIF_EXR));
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
			case(96): {			// RGB 
				pxintformat = QOpenGLTexture::TextureFormat::RGBA16_UNorm; /*RGBA8_UNorm*/
				pxformat = QOpenGLTexture::PixelFormat::RGB;
				pxtype = QOpenGLTexture::PixelType::Float32;
			} break;
			case(32): { 		// Depth
				pxintformat = QOpenGLTexture::TextureFormat::RGBA16_UNorm;
				pxformat = QOpenGLTexture::PixelFormat::Luminance;
				pxtype = QOpenGLTexture::PixelType::Float32;
			} break;
			case(24): { 		// RGB 24bit (8bit/channel)
				pxintformat = QOpenGLTexture::TextureFormat::RGBA16_UNorm;
				pxformat = QOpenGLTexture::PixelFormat::RGB;
				pxtype = QOpenGLTexture::PixelType::UInt8;
			} break;
		}
		m_texture[slot]->setFormat(pxintformat); // internal format
		m_texture[slot]->allocateStorage(pxformat, pxtype); // format & type

		// Saves EXR image with same formato
		// FreeImage_Save(format, image, "output.exr", 0);

		//GLubyte* texture = new GLubyte[4 * w*h];
		//char* pixels = (char*)FreeImage_GetBits(imagen);
		GLfloat* texture = new GLfloat[3 * w*h];
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
		float min_depth = FLT_MAX;
		float max_depth = FLT_MIN;
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
				texture[j * 3 + 0] = pixels[j * 3 + 0];
				texture[j * 3 + 1] = pixels[j * 3 + 1];
				texture[j * 3 + 2] = pixels[j * 3 + 2];
			}
			else {
				depth[j] = pixels[j]; // / 357.f; // normalization factor found from max_depth
				if (pixels[j] > max_depth) max_depth = pixels[j];
				if (pixels[j] < min_depth) min_depth = pixels[j];
			}
			//		texture[j * 4 + 3] = 1.f;

			//		std::cout<< j <<": "<<(int)textura[j*4+0]
			//					  <<"**"<<(int)textura[j*4+1]
			//					  <<"**"<<(int)textura[j*4+2]
			//					  <<"**"<<(int)textura[j*4+3]<<std::endl;
		}
		if (bpp == 32) {
			std::cout << "min_depth: " << min_depth << std::endl;
			std::cout << "max_depth: " << max_depth << std::endl;
		}
		m_texture[slot]->setData(pxformat, pxtype, (GLvoid*) (bpp != 32) ? texture : depth);
	}

	m_program->bind();
	m_program->setUniformValue("texture", 0);
	m_program->setUniformValue("textureA", 1);
	m_program->setUniformValue("textureB", 2);
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
	
	loadTexture(m_tex_path, 0);
	loadTexture(m_tex_A_path, 1);
	loadTexture(m_tex_B_path, 2);
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

	for (uint i=0; i<3; i++)
		m_texture[i]->bind(i, QOpenGLTexture::TextureUnitReset::ResetTextureUnit);

	glDrawArrays(GL_QUADS, 0, 4);

	glDisableVertexAttribArray(1);
	glDisableVertexAttribArray(0);

	m_program->release();

	++m_frame;
}
