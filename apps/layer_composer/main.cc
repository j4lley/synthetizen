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
#include <QFileDialog>

#include <FreeImage.h>

#include <cstdio>
#include <iostream>

#include <string>
#include <sstream>
#include <iomanip>

#if 0
char * strrep(char *str, char *o_s, char *n_s)
{
	char *newstr = NULL;
	char *c = NULL;

	/* no substring found */
	if ((c = strstr(str, o_s)) == NULL) {
		return str;
	}

	if ((newstr = (char *)malloc((int) sizeof(str) -
		(int) sizeof(o_s) +
		(int) sizeof(n_s) + 1)) == NULL) {
		printf("ERROR: unable to allocate memory\n");
		return NULL;
	}

	strncpy(newstr, str, c - str);
	sprintf(newstr + (c - str), "%s%s", n_s, c + strlen(o_s));

	return newstr;
}
#endif

#define NUM_TEXTURES 15/*6*/

class ViewerWindow : public OpenGLWindow
{
public:
	ViewerWindow();
	ViewerWindow(char* backgroundPath, 
				 char* backgroundDepthPath, 
				 char* irpvPath, 
				 char* irpvDepthPath, 
				 char* irPath, 
				 char* alphaPath, 
				 char* diffuseMapPath,
				 char* diffuseDirectMapPath,
				 char* diffuseIndirectMapPath,
				 char* diffuseFilterMapPath,
				 char* reflectionMapPath,
				 char* reflectionDirectMapPath,
				 char* reflectionIndirectMapPath,
				 char* reflectionFilterMapPath,
				 char* materialsPath,
				 char* outPath,
				 bool autoClose);

	void initialize() override;
	void render() override;

private:
	void loadTexture(const char *filename, int slot, bool verbose = false);
	void loadAllTextures();
	void updateFrameTextures();

	void AdjustRatio(int w, int h);

	GLuint m_posAttr;
	GLuint m_colAttr;
	GLuint m_texcAttr;
	GLuint m_matrixUniform;

	char* m_backgroundPath;
	char* m_backgroundDepthPath;
	char* m_irpvPath;
	char* m_irpvDepthPath;
	char* m_irPath;
	char* m_alphaPath;

	char* m_diffuseMapPath;
	char* m_diffuseDirectMapPath;
	char* m_diffuseIndirectMapPath;
	char* m_diffuseFilterMapPath;
	char* m_reflectionMapPath;
	char* m_reflectionDirectMapPath;
	char* m_reflectionIndirectMapPath;
	char* m_reflectionFilterMapPath;
	char* m_materialsPath;
	char* m_outPath;

	bool m_saved;
	bool m_autoClose;

	QOpenGLShaderProgram *m_program;	
	QOpenGLTexture		 *m_texture[NUM_TEXTURES];
	long int m_frame;
	float m_epsilon; // decimal tolerance for ratio semblance

	unsigned int m_winWidth;
	unsigned int m_winHeight;

	GLuint m_defaultFBO;
	std::vector<float> m_pixelBuffer;
};

ViewerWindow::ViewerWindow()
	: m_program(0)
	, m_frame(0)
{
	m_saved = false;
	m_epsilon = 0.001;

	// DO NOT PLEASE EVER CHANGE THIS TO AN ABSOLUTE PATH !!!
	m_backgroundPath = "../../../resources/images/0000_ini.png";
	m_irpvPath = "../../../resources/images/0000_irpv.png";
	m_irPath = "../../../resources/images/0000_ir.png";
	m_alphaPath = "../../../resources/images/0000_alpha.png";
	m_outPath = "../../../resources/output/0000_output.exr";
	// DO NOT PLEASE EVER CHANGE THIS TO AN ABSOLUTE PATH !!!
}


ViewerWindow::ViewerWindow
	(char* backgroundPath,
	char* backgroundDepthPath,
	char* irpvPath,
	char* irpvDepthPath,
	char* irPath,
	char* alphaPath,
	char* diffuseMapPath,
	char* diffuseDirectMapPath,
	char* diffuseIndirectMapPath,
	char* diffuseFilterMapPath,
	char* reflectionMapPath,		
	char* reflectionDirectMapPath,
	char* reflectionIndirectMapPath,
	char* reflectionFilterMapPath,
	char* materialsPath,
	char* outPath,
	bool autoClose)
	: m_program(0)
	, m_frame(0)
{
	m_saved = false;
	m_epsilon = 0.001;

	m_backgroundPath = backgroundPath;
	m_backgroundDepthPath = backgroundDepthPath;
	m_irpvPath = irpvPath;
	m_irpvDepthPath = irpvDepthPath;
	m_irPath = irPath;
	m_alphaPath = alphaPath;
	m_diffuseMapPath = diffuseMapPath;
	m_diffuseDirectMapPath = diffuseDirectMapPath;
	m_diffuseIndirectMapPath = diffuseIndirectMapPath;
	m_diffuseFilterMapPath = diffuseFilterMapPath;
	m_reflectionMapPath = reflectionMapPath;
	m_reflectionDirectMapPath = reflectionDirectMapPath;
	m_reflectionIndirectMapPath = reflectionIndirectMapPath;
	m_reflectionFilterMapPath = reflectionFilterMapPath;
	m_materialsPath = materialsPath;
	m_outPath = outPath;
	m_autoClose = autoClose;
}

void ViewerWindow::AdjustRatio(int w, int h)
{
	float targetRatio = float(w) / float(h);
	resize(w, h);
	bool correct;
	correct = fabs(targetRatio - (float(width()) / float(height()))) < m_epsilon;
	while (!correct)
	{
		w = (9 * w) / 10;
		h = (9 * h) / 10;
		resize(w, h);
		correct = fabs(targetRatio - (float(width())/float(height()))) < m_epsilon;
		// std::cout << correct << std::endl;
	}


	m_winWidth = width();
	m_winHeight = height();

}


void ViewerWindow::loadTexture(const char *filename, int slot, bool verbose)
{
	FREE_IMAGE_FORMAT format = FreeImage_GetFileType(filename, 0);//Automatocally detects the format(from over 20 formats!)
	bool isEXR = ((format == FIF_SGI/*Octane EXR*/) || (format == FIF_EXR));
	//std::cout << "The image format is: " << format << std::endl;
	if (!isEXR)
	{
		// simple case with png texture supported by QImage
		//m_texture = new QOpenGLTexture(QImage(QString(":/images/andromeda.png")).mirrored());
		m_texture[slot] = new QOpenGLTexture(QImage(filename).mirrored());

		if (slot == 0)
		{
			m_winWidth = m_texture[slot]->width();
			m_winHeight = m_texture[slot]->height();
			if (verbose) std::cout << "Size at load " << m_winWidth << " " << m_winHeight << std::endl;

			AdjustRatio(m_winWidth, m_winHeight);
		}
		// Avoid texture blurring ...
		m_texture[slot]->setMinificationFilter(QOpenGLTexture::Filter::Nearest);
		m_texture[slot]->setMagnificationFilter(QOpenGLTexture::Filter::Nearest);
	}
	else {
		// find the buffer format
		//FREE_IMAGE_FORMAT format = FreeImage_GetFileType(filename, 0);//Automatocally detects the format(from over 20 formats!)
		FIBITMAP* image = FreeImage_Load(format, filename);
		// translate from FreeImage to QImage:
		// https://github.com/zoon/FreeImage-Plugin-for-QT4/blob/master/FreeImageHandler.cpp
		int w = FreeImage_GetWidth(image);
		int h = FreeImage_GetHeight(image);
		if (verbose) std::cout << "The size of the image is: " << "(" << format << ")" << w << " * " << h << std::endl; //Some debugging code
		if (slot == 0)
		{
			m_winWidth = w;
			m_winHeight = h;
			if (verbose) std::cout << "Size at load " << m_winWidth << " " << m_winHeight << std::endl;

			AdjustRatio(w, h);

		}
		// standard bitmap type																												
		WORD bpp = FreeImage_GetBPP(image);
		if (verbose) std::cout << "The image is BPP: " << bpp << std::endl;

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
		// Avoid texture blurring ...
		m_texture[slot]->setMinificationFilter(QOpenGLTexture::Filter::Nearest);
		m_texture[slot]->setMagnificationFilter(QOpenGLTexture::Filter::Nearest);
		// Saves EXR image with same formato
		// FreeImage_Save(format, image, "output.exr", 0);

		//GLubyte* texture = new GLubyte[4 * w*h];
		//char* pixels = (char*)FreeImage_GetBits(imagen);

		GLfloat* texture;
		if (bpp == 96)
			texture = new GLfloat[3 * w*h];
		else
			texture = new GLfloat[4 * w*h];
		
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
		uchar* pixels_depth = (uchar*)FreeImage_GetBits(image);

		float min_depth = FLT_MAX;
		float max_depth = FLT_MIN;

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
				if (bpp == 96) { // RGB channels
					texture[j * 3 + 0] = pixels[j * 3 + 0];
					texture[j * 3 + 1] = pixels[j * 3 + 1];
					texture[j * 3 + 2] = pixels[j * 3 + 2];
				}
				else { // RGBA channels
					texture[j * 4 + 0] = pixels[j * 4 + 0];
					texture[j * 4 + 1] = pixels[j * 4 + 1];
					texture[j * 4 + 2] = pixels[j * 4 + 2];
					texture[j * 4 + 3] = pixels[j * 4 + 3];
				}
			}
			else {
#if 1
				depth[j] = pixels[j]/* / 357.f*/;
#else			
				ushort c0 = pixels_depth[j + 0];
				ushort c1 = pixels_depth[j + 1];
				ushort c2 = pixels_depth[j + 2];
				//uint c3 = pixels_depth[j + 3];
				ushort ushort_depth = (c0 + (c1 << 8) + (c2 << 16)/* + (c3 << 24)*/); // c0 high freq. // c1 medium  // c2 low // c3 null					
				float my_depth = float(ushort_depth) / float((1 << 24) - 1);
				
				depth[j] = my_depth;
#endif
				if (depth[j] < min_depth) min_depth = depth[j];
				if (depth[j] > max_depth) max_depth = depth[j];

			}
			//		texture[j * 4 + 3] = 1.f;

			//		std::cout<< j <<": "<<(int)textura[j*4+0]
			//					  <<"**"<<(int)textura[j*4+1]
			//					  <<"**"<<(int)textura[j*4+2]
			//					  <<"**"<<(int)textura[j*4+3]<<std::endl;
		}
		if (bpp == 32 && verbose) {
			std::cout << "::> min depth = " << min_depth << std::endl;
			std::cout << "::> max depth = " << max_depth << std::endl;
		}
		m_texture[slot]->setData(pxformat, pxtype, (GLvoid*) (bpp != 32) ? texture : depth);
	}

	m_program->bind();
	m_program->setUniformValue("tex_background", 0);
	m_program->setUniformValue("tex_background_depth", 1);
	m_program->setUniformValue("tex_irpv", 2);
	m_program->setUniformValue("tex_irpv_depth", 3);
	m_program->setUniformValue("tex_ir", 4);
	m_program->setUniformValue("tex_alpha", 5);
	
	m_program->setUniformValue("tex_diffuse_hero", 6);
	m_program->setUniformValue("tex_diffuse_direct_hero", 7);
	m_program->setUniformValue("tex_diffuse_indirect_hero", 8);
	m_program->setUniformValue("tex_diffuse_filter_hero", 9);
	
	m_program->setUniformValue("tex_reflection_hero", 10);
	m_program->setUniformValue("tex_reflection_direct_hero", 11);
	m_program->setUniformValue("tex_reflection_indirect_hero", 12);
	m_program->setUniformValue("tex_reflection_filter_hero", 13);

	m_program->setUniformValue("tex_materials_hero", 14);
}

void ViewerWindow::loadAllTextures()
{
	std::cout << "Loading Bg" << std::endl;
	loadTexture(m_backgroundPath, 0);
	std::cout << "Loading Bg_depth" << std::endl;
	loadTexture(m_backgroundDepthPath, 1);
	std::cout << "Loading irpv" << std::endl;
	loadTexture(m_irpvPath, 2);
	std::cout << "Loading irpv_depth" << std::endl;
	loadTexture(m_irpvDepthPath, 3);
	std::cout << "Loading ir" << std::endl;
	loadTexture(m_irPath, 4);
	std::cout << "Loading Alpha" << std::endl;
	loadTexture(m_alphaPath, 5);

	std::cout << "Loading (Street+Hero) diffuse" << std::endl;
	loadTexture(m_diffuseMapPath, 6);
	std::cout << "Loading (Street+Hero) diffuse direct" << std::endl;
	loadTexture(m_diffuseDirectMapPath, 7);
	std::cout << "Loading (Street+Hero) diffuse indirect" << std::endl;
	loadTexture(m_diffuseIndirectMapPath, 8);
	std::cout << "Loading (Street+Hero) diffuse filter" << std::endl;
	loadTexture(m_diffuseFilterMapPath, 9);

	std::cout << "Loading (Street+Hero) reflection" << std::endl;
	loadTexture(m_reflectionMapPath, 10);
	std::cout << "Loading (Street+Hero) reflection direct" << std::endl;
	loadTexture(m_reflectionDirectMapPath, 11);
	std::cout << "Loading (Street+Hero) reflection indirect" << std::endl;
	loadTexture(m_reflectionIndirectMapPath, 12);
	std::cout << "Loading (Street+Hero) reflection filter" << std::endl;
	loadTexture(m_reflectionFilterMapPath, 13);

	std::cout << "Loading (Street+Hero) materials" << std::endl;
	loadTexture(m_materialsPath, 14);
}

void ViewerWindow::updateFrameTextures()
{
	char buf[512];
	char* data_str = "D:\\workspace\\adas\\unity\\octane\\temp\\rendersFran3\\test_sequence";

	//std::cout << "\n\n Updating Bg" << std::endl;	
	loadTexture(m_backgroundPath, 0);
	//std::cout << "Loading Bg_depth" << std::endl;	
	loadTexture(m_backgroundDepthPath, 1);
	//std::cout << "Loading irpv" << std::endl;
	sprintf(buf, "%s\\%s\\%s\\beauty_%04d.exr", data_str,"street_car","beauty", 1700 + (m_frame % 21));
	loadTexture(/*m_irpvPath*/buf, 2);
	//std::cout << "Loading irpv_depth" << std::endl;
	sprintf(buf, "%s\\%s\\%s\\depth_%04d.exr", data_str, "street_car", "depth", 1700 + (m_frame % 21));
	loadTexture(/*m_irpvDepthPath*/buf, 3);
	
	//std::cout << "Loading ir" << std::endl;
	loadTexture(m_irPath, 4);

	//std::cout << "Loading Alpha: "; // << std::endl;
	sprintf(buf, "%s\\%s\\%s\\opacity_%04d.exr", data_str, "car", "opacity", 1700 + (m_frame % 21));
	loadTexture(/*m_alphaPath*/buf, 5);

	//std::cout << "Loading (Street+Hero) diffuse" << std::endl;
	sprintf(buf, "%s\\%s\\%s\\%s\\%04d.exr", data_str, "street_car", "diffuse","all", 1700 + (m_frame % 21));
	loadTexture(/*m_diffuseMapPath*/buf, 6);
	//std::cout << "Loading (Street+Hero) diffuse direct" << std::endl;
	sprintf(buf, "%s\\%s\\%s\\%s\\%04d.exr", data_str, "street_car", "diffuse", "direct", 1700 + (m_frame % 21));
	loadTexture(/*m_diffuseDirectMapPath*/buf, 7);
	//std::cout << "Loading (Street+Hero) diffuse indirect" << std::endl;
	sprintf(buf, "%s\\%s\\%s\\%s\\%04d.exr", data_str, "street_car", "diffuse", "indirect", 1700 + (m_frame % 21));
	loadTexture(/*m_diffuseIndirectMapPath*/buf, 8);
	//std::cout << "Loading (Street+Hero) diffuse filter" << std::endl;
	sprintf(buf, "%s\\%s\\%s\\%s\\%04d.exr", data_str, "street_car", "diffuse", "filter", 1700 + (m_frame % 21));
	loadTexture(/*m_diffuseFilterMapPath*/buf, 9);

	//std::cout << "Loading (Street+Hero) reflection" << std::endl;
	sprintf(buf, "%s\\%s\\%s\\%s\\%04d.exr", data_str, "street_car", "reflection", "all", 1700 + (m_frame % 21));
	loadTexture(/*m_reflectionMapPath*/buf, 10);
	//std::cout << "Loading (Street+Hero) reflection direct" << std::endl;
	sprintf(buf, "%s\\%s\\%s\\%s\\%04d.exr", data_str, "street_car", "reflection", "direct", 1700 + (m_frame % 21));
	loadTexture(/*m_reflectionDirectMapPath*/buf, 11);	
	//std::cout << "Loading (Street+Hero) reflection indirect" << std::endl;
	sprintf(buf, "%s\\%s\\%s\\%s\\%04d.exr", data_str, "street_car", "reflection", "indirect", 1700 + (m_frame % 21));
	loadTexture(/*m_reflectionIndirectMapPath*/buf, 12);
	//std::cout << "Loading (Street+Hero) reflection filter" << std::endl;
	sprintf(buf, "%s\\%s\\%s\\%s\\%04d.exr", data_str, "street_car", "reflection", "filter", 1700 + (m_frame % 21));
	loadTexture(/*m_reflectionFilterMapPath*/buf, 13);

	//std::cout << "Loading (Street+Hero) materials" << std::endl;
	sprintf(buf, "%s\\%s\\%s\\%04d.png", data_str, "street_car", "material_id", 1700 + (m_frame % 21));
	loadTexture(/*m_materialsPath*/buf, 14);
}


void ViewerWindow::initialize()
{
	m_program = new QOpenGLShaderProgram(this);
	m_program->addShaderFromSourceFile(QOpenGLShader::Vertex, ":/shaders/default.vp");
	m_program->addShaderFromSourceFile(QOpenGLShader::Fragment, ":/shaders/composer_differential_rendering.fp");
	m_program->link();
	m_posAttr = m_program->attributeLocation("posAttr");
//	m_colAttr = m_program->attributeLocation("colAttr");
	m_texcAttr = m_program->attributeLocation("texcAttr");
	m_matrixUniform = m_program->uniformLocation("matrix");

	// These are the window's original sizes
	m_winWidth = width(); //m_texture[0]->width();
	m_winHeight = height(); //m_texture[0]->height();

	loadAllTextures();

	m_defaultFBO = GLuint(0);
	
	std::cout << "Size at init " << m_winWidth << " " << m_winHeight << std::endl;

	m_pixelBuffer.resize(m_winWidth*m_winHeight*4);
}

void ViewerWindow::render()
{
	if (1/*m_ProcessSequence*/)
	{
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT | GL_STENCIL_BUFFER_BIT);
		//std::cout << "Update Textures ...!\n" << std::endl;
		updateFrameTextures();
	}

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

	//std::cout << m_frame << " ";
	//std::cout << width() << " " << height() << " / ";

	if (1/*!m_saved*/)
	{
		//AdjustRatio(m_winWidth, m_winHeight);
		std::cout << " - Saving - " << std::endl;
		/*
		std::vector float pixels
		bind buffer
		readpixels
		save with free image
		*/


		m_defaultFBO = defaultFramebufferObject();
		std::cout << "Main FBO Id: " << m_defaultFBO << std::endl;

		int w = m_winWidth;
		int h = m_winHeight;

		glBindFramebuffer(GL_READ_FRAMEBUFFER, m_defaultFBO);
		glReadPixels(0, 0, w, h, GL_RGBA, GL_FLOAT,(GLvoid *) &(m_pixelBuffer[0]));

		FIBITMAP* pBitmap;
		pBitmap = FreeImage_AllocateT(FIT_RGBAF, w, h, /*96*/128);

		unsigned int nPitch = FreeImage_GetPitch(pBitmap);
		std::cout << "Pitch: " << nPitch << std::endl;
		BYTE *pBits = reinterpret_cast<BYTE*>(FreeImage_GetBits(pBitmap));

		for (int y = 0; y < h; ++y)
		{
			float *pPixel = reinterpret_cast<float*>(pBits);
			for (int x = 0; x < w; ++x)
			{
				pPixel[0] = m_pixelBuffer[(y*w + x) * 4 + 0];
				pPixel[1] = m_pixelBuffer[(y*w + x) * 4 + 1];
				pPixel[2] = m_pixelBuffer[(y*w + x) * 4 + 2];
				pPixel[3] = m_pixelBuffer[(y*w + x) * 4 + 3];
				pPixel += /*3*/4;
			}
			pBits += nPitch;
		}
		//std::cout << w << " " << h << " / ";


		// FIBITMAP* image = FreeImage_LoadFromMemory(FIF_EXR, pixels.at);
		// BYTE mem_buffer = (BYTE)malloc(w*h*4);

		// memcpy(mem_buffer, pixels, w*h * 4);
		//FIMEMORY *hmem = FreeImage_OpenMemory(pixels, w*h * 4);
		
		//FIMEMORY *hmem = FreeImage_OpenMemory( reinterpret_cast<BYTE*> &(pixels[0]), w*h * 3 * sizeof(float));
		//FIBITMAP* image = FreeImage_LoadFromMemory(FIF_EXR, hmem);

		//DLL_API FIBITMAP *DLL_CALLCONV FreeImage_ConvertFromRawBits(BYTE *bits, int width, int height, int pitch, unsigned bpp, unsigned red_mask, unsigned green_mask, unsigned blue_mask, BOOL topdown FI_DEFAULT(FALSE));


		//FIBITMAP* image = FreeImage_ConvertFromRawBits((BYTE *) &(pixels[0]), w, h, w*3*sizeof(float), 3 * sizeof(float), 0, 0, 0, 0);

		//FREE_IMAGE_FORMAT format = FreeImage_GetFileType("E:/Dan/Projects/synthetizen/images/0000_irpv.exr", 0);
		//FIBITMAP* image = FreeImage_Load(format, "E:/Dan/Projects/synthetizen/images/0000_irpv.exr");
		//FIBITMAP* imageconv = FreeImage_ConvertFromRawBitsEx(true,(BYTE*) &(pixels[0]), FREE_IMAGE_TYPE::FIT_FLOAT, w, h, w*3*sizeof(float), 96, 0, 0, 0, 0);
		//FIBITMAP* image = FreeImage_LoadFromMemory(format, hmem, 0);
		//FIBITMAP* imageconv = FreeImage_ConvertToRGBF(image);
		
		// Windows FreeImage.dll should use FIF_EXR
		char buf[512];
		sprintf(buf, "%s_%04d.exr", m_outPath, 1700 + (m_frame % 21));
		FreeImage_Save(FIF_EXR/*SGI*//*should be an EXR*/, pBitmap, /*m_outPath*/buf, 0);	

		// Free resources
		FreeImage_Unload(pBitmap);

		m_saved = true;
		
		if(m_autoClose) close();
	}
}


/* TODO:
Window size
*/

int main(int argc, char **argv)
{
	QGuiApplication app(argc, argv);

	QCoreApplication::setAttribute(Qt::AA_UseDesktopOpenGL); // there is still a weird Qt bug when running the application on a second screen
	
	QCommandLineParser parser;

	QCommandLineOption autoCloseOption("ac", QCoreApplication::translate("main", "Auto-close after render and save"));
	parser.addOption(autoCloseOption);

	QCommandLineOption backgroundOpt("bg",
		QCoreApplication::translate("main", "Background of the composition"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(backgroundOpt);
	//std::cout << "BG Read" << std::endl;

	QCommandLineOption backgroundDepthOpt("bg_depth",
		QCoreApplication::translate("main", "Background depth of the composition"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(backgroundDepthOpt);

	QCommandLineOption irpvOpt("irpv",
		QCoreApplication::translate("main", "Full render of the virtual part of the composition"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(irpvOpt);
	//std::cout << "Irpv Read" << std::endl;

	QCommandLineOption irpvDepthOpt("irpv_depth",
		QCoreApplication::translate("main", "Full render depth of the virtual part of the composition"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(irpvDepthOpt);

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

	QCommandLineOption diffuseOpt("diff_map",
		QCoreApplication::translate("main", "Diffuse map of hero object"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(diffuseOpt);
	// diffuse direct
	QCommandLineOption diffuseDirectOpt("diff_direct_map",
		QCoreApplication::translate("main", "Diffuse direct map of hero object"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(diffuseDirectOpt);
	// diffuse indirect
	QCommandLineOption diffuseIndirectOpt("diff_indirect_map",
		QCoreApplication::translate("main", "Diffuse indirect map of hero object"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(diffuseIndirectOpt);
	// diffuse filter
	QCommandLineOption diffuseFilterOpt("diff_filter_map",
		QCoreApplication::translate("main", "Diffuse filter map of hero object"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(diffuseFilterOpt);

	// reflection
	QCommandLineOption reflectionOpt("refl_map",
		QCoreApplication::translate("main", "Reflection map of hero object"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(reflectionOpt);
	// reflection direct
	QCommandLineOption reflectionDirectOpt("refl_direct_map",
		QCoreApplication::translate("main", "Reflection direct map of hero object"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(reflectionDirectOpt);
	// reflection indirect
	QCommandLineOption reflectionIndirectOpt("refl_indirect_map",
		QCoreApplication::translate("main", "Reflection direct map of hero object"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(reflectionIndirectOpt);
	// reflection filter
	QCommandLineOption reflectionFilterOpt("refl_filter_map",
		QCoreApplication::translate("main", "Reflection filter map of hero object"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(reflectionFilterOpt);

	// material ID
	QCommandLineOption materialsOpt("materials",
		QCoreApplication::translate("main", "Materials of hero object"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(materialsOpt);

	// Should be always an EXR file right now !!!
	QCommandLineOption outOpt("o",
		QCoreApplication::translate("main", "Output file path"),
		QCoreApplication::translate("main", "directory"));
	parser.addOption(outOpt);
	std::cout << "Output Read" << std::endl;

	parser.process(app);

	bool autoClose = parser.isSet(autoCloseOption);

	QString qBackgroundPath = parser.value(backgroundOpt);
	std::string strBackgroundPath = qBackgroundPath.toUtf8().constData();
	char* backgroundPath = (char*)strBackgroundPath.c_str();
	std::cout << "BG Converted: " << backgroundPath << std::endl;

	QString qBackgroundDepthPath = parser.value(backgroundDepthOpt);
	std::string strBackgroundDepthPath = qBackgroundDepthPath.toUtf8().constData();
	char* backgroundDepthPath = (char*)strBackgroundDepthPath.c_str();
	std::cout << "BG_depth Converted: " << backgroundDepthPath << std::endl;

	QString qIrpvPath = parser.value(irpvOpt);
	std::string strIrpvPath = qIrpvPath.toUtf8().constData();
	char* irpvPath = (char*)strIrpvPath.c_str();
	std::cout << "Irpv Converted: " << irpvPath << std::endl;

	QString qIrpvDepthPath = parser.value(irpvDepthOpt);
	std::string strIrpvDepthPath = qIrpvDepthPath.toUtf8().constData();
	char* irpvDepthPath = (char*)strIrpvDepthPath.c_str();
	std::cout << "Irpv_depth Converted: " << irpvDepthPath << std::endl;

	QString qIrPath = parser.value(irOpt);
	std::string strIrPath = qIrPath.toUtf8().constData();
	char* irPath = (char*)strIrPath.c_str();
	std::cout << "Ir Converted: " << irPath << std::endl;

	QString qAlphaPath = parser.value(alphaOpt);
	std::string strAlphaPath = qAlphaPath.toUtf8().constData();
	char* alphaPath = (char*)strAlphaPath.c_str();
	std::cout << "Alpha Converted: " << alphaPath << std::endl;

	//diffuse
	QString qDiffuseMapPath = parser.value(diffuseOpt);
	std::string strDiffusePath = qDiffuseMapPath.toUtf8().constData();
	char* diffusePath = (char*)strDiffusePath.c_str();
	std::cout << "DiffuseMap Converted: " << diffusePath << std::endl;	
	//diffuse direct
	QString qDiffuseDirectMapPath = parser.value(diffuseDirectOpt);
	std::string strDiffuseDirectPath = qDiffuseDirectMapPath.toUtf8().constData();
	char* diffuseDirectPath = (char*)strDiffuseDirectPath.c_str();
	std::cout << "DiffuseDirectMap Converted: " << diffuseDirectPath << std::endl;
	// diffuse indirect
	QString qDiffuseIndirectMapPath = parser.value(diffuseIndirectOpt);
	std::string strDiffuseIndirectPath = qDiffuseIndirectMapPath.toUtf8().constData();
	char* diffuseIndirectPath = (char*)strDiffuseIndirectPath.c_str();
	std::cout << "DiffuseIndirectMap Converted: " << diffuseIndirectPath << std::endl;
	// diffuse filter
	QString qDiffuseFilterMapPath = parser.value(diffuseFilterOpt);
	std::string strDiffuseFilterPath = qDiffuseFilterMapPath.toUtf8().constData();
	char* diffuseFilterPath = (char*)strDiffuseFilterPath.c_str();
	std::cout << "DiffuseFilterMap Converted: " << diffuseFilterPath << std::endl;

	// reflection
	QString qReflectionMapPath = parser.value(reflectionOpt);
	std::string strReflectionPath = qReflectionMapPath.toUtf8().constData();
	char* reflectionPath = (char*)strReflectionPath.c_str();
	std::cout << "reflectionMap Converted: " << reflectionPath << std::endl;
	// reflection direct
	QString qReflectionDirectMapPath = parser.value(reflectionDirectOpt);
	std::string strReflectionDirectPath = qReflectionDirectMapPath.toUtf8().constData();
	char* reflectionDirectPath = (char*)strReflectionDirectPath.c_str();
	std::cout << "reflectionDirectMap Converted: " << reflectionDirectPath << std::endl;
	// reflection indirect
	QString qReflectionIndirectMapPath = parser.value(reflectionIndirectOpt);
	std::string strReflectionIndirectPath = qReflectionIndirectMapPath.toUtf8().constData();
	char* reflectionIndirectPath = (char*)strReflectionIndirectPath.c_str();
	std::cout << "reflectionIndirectMap Converted: " << reflectionIndirectPath << std::endl;
	// reflection filter
	QString qReflectionFilterMapPath = parser.value(reflectionFilterOpt);
	std::string strReflectionFilterPath = qReflectionFilterMapPath.toUtf8().constData();
	char* reflectionFilterPath = (char*)strReflectionFilterPath.c_str();
	std::cout << "reflectionFilterMap Converted: " << reflectionFilterPath << std::endl;

	// reflection filter
	QString qMaterialsPath = parser.value(materialsOpt);
	std::string strMaterialsPath = qMaterialsPath.toUtf8().constData();
	char* materialsPath = (char*)strMaterialsPath.c_str();
	std::cout << "materialsPath Converted: " << materialsPath << std::endl;

	QString qOutPath = parser.value(outOpt);
	std::string strOutPath = qOutPath.toUtf8().constData();
	char* outPath = (char*)strOutPath.c_str();
	std::cout << "Output Converted: " << outPath << std::endl;

	QSurfaceFormat format;
	format.setSamples(16);

	std::cout << "Creating composition with paths: " << std::endl 
		<< backgroundPath << std::endl
		<< backgroundDepthPath << std::endl
		<< irpvPath << std::endl 
		<< irpvDepthPath << std::endl
		<< irPath << std::endl 
		<< alphaPath << std::endl
		<< diffusePath << std::endl
		<< diffuseDirectPath << std::endl
		<< diffuseIndirectPath << std::endl
		<< diffuseFilterPath << std::endl
		<< reflectionPath << std::endl
  	    << reflectionDirectPath << std::endl
		<< reflectionIndirectPath << std::endl
		<< reflectionFilterPath << std::endl
		<< materialsPath << std::endl
		<< outPath << std::endl;

	if (strBackgroundPath.empty() || strIrpvPath.empty() || strIrPath.empty() || strAlphaPath.empty())
	{
		std::cout << "One or more image paths are missing." << std::endl << "Exiting application." << std::endl;
	} else {
		/* SINGLE FRAME EXECUTION*/		
		ViewerWindow window(backgroundPath, backgroundDepthPath, irpvPath, irpvDepthPath, irPath, alphaPath, 
						    diffusePath, diffuseDirectPath, diffuseIndirectPath, diffuseFilterPath,
							reflectionPath, reflectionDirectPath, reflectionIndirectPath, reflectionFilterPath,
							materialsPath,
							outPath, autoClose);
		//ViewerWindow window;
		//window.initialize();

		window.setFormat(format);
		window.resize(640, 480);
		window.show();
	
		window.setAnimating(true);
	
		// Loading and composition starts now
		return app.exec();

		// This is after main loop
	}
}
