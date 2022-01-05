# coding: utf-8
from sqlalchemy import BigInteger, Boolean, CheckConstraint, Column, Date, DateTime, ForeignKey, Integer, SmallInteger, String, Text, UniqueConstraint, text
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.postgresql import JSONB
from sqlalchemy.ext.declarative import declarative_base

from chats.db import Base

metadata = Base.metadata


class AuthGroup(Base):
    __tablename__ = 'auth_group'

    id = Column(Integer, primary_key=True, server_default=text("nextval('auth_group_id_seq'::regclass)"))
    name = Column(String(150), nullable=False, unique=True)


class AuthUser(Base):
    __tablename__ = 'auth_user'

    id = Column(Integer, primary_key=True, server_default=text("nextval('auth_user_id_seq'::regclass)"))
    password = Column(String(128), nullable=False)
    last_login = Column(DateTime(True))
    is_superuser = Column(Boolean, nullable=False)
    username = Column(String(150), nullable=False, unique=True)
    first_name = Column(String(150), nullable=False)
    last_name = Column(String(150), nullable=False)
    email = Column(String(254), nullable=False)
    is_staff = Column(Boolean, nullable=False)
    is_active = Column(Boolean, nullable=False)
    date_joined = Column(DateTime(True), nullable=False)


class DjangoContentType(Base):
    __tablename__ = 'django_content_type'
    __table_args__ = (
        UniqueConstraint('app_label', 'model'),
    )

    id = Column(Integer, primary_key=True, server_default=text("nextval('django_content_type_id_seq'::regclass)"))
    app_label = Column(String(100), nullable=False)
    model = Column(String(100), nullable=False)


class DjangoMigration(Base):
    __tablename__ = 'django_migrations'

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('django_migrations_id_seq'::regclass)"))
    app = Column(String(255), nullable=False)
    name = Column(String(255), nullable=False)
    applied = Column(DateTime(True), nullable=False)


class DjangoSession(Base):
    __tablename__ = 'django_session'

    session_key = Column(String(40), primary_key=True, index=True)
    session_data = Column(Text, nullable=False)
    expire_date = Column(DateTime(True), nullable=False, index=True)


class PolznakEntitiesInterestarea(Base):
    __tablename__ = 'polznak_entities_interestarea'

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('polznak_entities_interestarea_id_seq'::regclass)"))
    name = Column(String(50), nullable=False)


class PolznakEntitiesLanguage(Base):
    __tablename__ = 'polznak_entities_language'

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('polznak_entities_language_id_seq'::regclass)"))
    language_code = Column(String(5), nullable=False)


class AuthPermission(Base):
    __tablename__ = 'auth_permission'
    __table_args__ = (
        UniqueConstraint('content_type_id', 'codename'),
    )

    id = Column(Integer, primary_key=True, server_default=text("nextval('auth_permission_id_seq'::regclass)"))
    name = Column(String(255), nullable=False)
    content_type_id = Column(ForeignKey('django_content_type.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)
    codename = Column(String(100), nullable=False)

    content_type = relationship('DjangoContentType')


class AuthUserGroup(Base):
    __tablename__ = 'auth_user_groups'
    __table_args__ = (
        UniqueConstraint('user_id', 'group_id'),
    )

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('auth_user_groups_id_seq'::regclass)"))
    user_id = Column(ForeignKey('auth_user.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)
    group_id = Column(ForeignKey('auth_group.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)

    group = relationship('AuthGroup')
    user = relationship('AuthUser')


class AuthtokenToken(Base):
    __tablename__ = 'authtoken_token'

    key = Column(String(40), primary_key=True, index=True)
    created = Column(DateTime(True), nullable=False)
    user_id = Column(ForeignKey('auth_user.id', deferrable=True, initially='DEFERRED'), nullable=False, unique=True)

    user = relationship('AuthUser', uselist=False)


class DjangoAdminLog(Base):
    __tablename__ = 'django_admin_log'
    __table_args__ = (
        CheckConstraint('action_flag >= 0'),
    )

    id = Column(Integer, primary_key=True, server_default=text("nextval('django_admin_log_id_seq'::regclass)"))
    action_time = Column(DateTime(True), nullable=False)
    object_id = Column(Text)
    object_repr = Column(String(200), nullable=False)
    action_flag = Column(SmallInteger, nullable=False)
    change_message = Column(Text, nullable=False)
    content_type_id = Column(ForeignKey('django_content_type.id', deferrable=True, initially='DEFERRED'), index=True)
    user_id = Column(ForeignKey('auth_user.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)

    content_type = relationship('DjangoContentType')
    user = relationship('AuthUser')


class PolznakEntitiesProfile(Base):
    __tablename__ = 'polznak_entities_profile'

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('polznak_entities_profile_id_seq'::regclass)"))
    gender = Column(String(1), nullable=False)
    birth_date = Column(Date)
    details = Column(Text, nullable=False)
    user_id = Column(ForeignKey('auth_user.id', deferrable=True, initially='DEFERRED'), nullable=False, unique=True)

    user = relationship('AuthUser', uselist=False)


class AuthGroupPermission(Base):
    __tablename__ = 'auth_group_permissions'
    __table_args__ = (
        UniqueConstraint('group_id', 'permission_id'),
    )

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('auth_group_permissions_id_seq'::regclass)"))
    group_id = Column(ForeignKey('auth_group.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)
    permission_id = Column(ForeignKey('auth_permission.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)

    group = relationship('AuthGroup')
    permission = relationship('AuthPermission')


class AuthUserUserPermission(Base):
    __tablename__ = 'auth_user_user_permissions'
    __table_args__ = (
        UniqueConstraint('user_id', 'permission_id'),
    )

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('auth_user_user_permissions_id_seq'::regclass)"))
    user_id = Column(ForeignKey('auth_user.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)
    permission_id = Column(ForeignKey('auth_permission.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)

    permission = relationship('AuthPermission')
    user = relationship('AuthUser')


class PolznakEntitiesPost(Base):
    __tablename__ = 'polznak_entities_post'

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('polznak_entities_post_id_seq'::regclass)"))
    content = Column(Text, nullable=False)
    created_at = Column(DateTime(True), nullable=False)
    likes = Column(Integer, nullable=False)
    dislikes = Column(Integer, nullable=False)
    creator_id = Column(ForeignKey('polznak_entities_profile.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)
    title = Column(String(128), nullable=False)

    creator = relationship('PolznakEntitiesProfile')


class PolznakEntitiesProfileInterest(Base):
    __tablename__ = 'polznak_entities_profile_interests'
    __table_args__ = (
        UniqueConstraint('profile_id', 'interestarea_id'),
    )

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('polznak_entities_profile_interests_id_seq'::regclass)"))
    profile_id = Column(ForeignKey('polznak_entities_profile.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)
    interestarea_id = Column(ForeignKey('polznak_entities_interestarea.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)

    interestarea = relationship('PolznakEntitiesInterestarea')
    profile = relationship('PolznakEntitiesProfile')


class PolznakEntitiesProfileKnowsLanguage(Base):
    __tablename__ = 'polznak_entities_profile_knows_languages'
    __table_args__ = (
        UniqueConstraint('profile_id', 'language_id'),
    )

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('polznak_entities_profile_knows_languages_id_seq'::regclass)"))
    profile_id = Column(ForeignKey('polznak_entities_profile.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)
    language_id = Column(ForeignKey('polznak_entities_language.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)

    language = relationship('PolznakEntitiesLanguage')
    profile = relationship('PolznakEntitiesProfile')


class RecommendationsAuthorspecialword(Base):
    __tablename__ = 'recommendations_authorspecialwords'

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('recommendations_authorspecialwords_id_seq'::regclass)"))
    unque_and_long_words = Column(JSONB(astext_type=Text()), nullable=False)
    author_id = Column(ForeignKey('polznak_entities_profile.id', deferrable=True, initially='DEFERRED'), nullable=False, unique=True)

    author = relationship('PolznakEntitiesProfile', uselist=False)


class PolznakEntitiesComment(Base):
    __tablename__ = 'polznak_entities_comment'

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('polznak_entities_comment_id_seq'::regclass)"))
    body = Column(Text, nullable=False)
    send_at = Column(DateTime(True), nullable=False)
    post_id = Column(ForeignKey('polznak_entities_post.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)
    sender_id = Column(ForeignKey('polznak_entities_profile.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)

    post = relationship('PolznakEntitiesPost')
    sender = relationship('PolznakEntitiesProfile')


class PolznakEntitiesConversation(Base):
    __tablename__ = 'polznak_entities_conversation'

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('polznak_entities_conversation_id_seq'::regclass)"))
    initiator_id = Column(ForeignKey('polznak_entities_post.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)

    initiator = relationship('PolznakEntitiesPost')


class PolznakEntitiesUseropinion(Base):
    __tablename__ = 'polznak_entities_useropinion'
    __table_args__ = (
        UniqueConstraint('post_id', 'sender_id'),
    )

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('polznak_entities_useropinion_id_seq'::regclass)"))
    opinion = Column(Integer, nullable=False)
    post_id = Column(ForeignKey('polznak_entities_post.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)
    sender_id = Column(ForeignKey('polznak_entities_profile.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)

    post = relationship('PolznakEntitiesPost')
    sender = relationship('PolznakEntitiesProfile')


class PolznakEntitiesConversationParticipant(Base):
    __tablename__ = 'polznak_entities_conversation_participants'
    __table_args__ = (
        UniqueConstraint('conversation_id', 'profile_id'),
    )

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('polznak_entities_conversation_participants_id_seq'::regclass)"))
    conversation_id = Column(ForeignKey('polznak_entities_conversation.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)
    profile_id = Column(ForeignKey('polznak_entities_profile.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)

    conversation = relationship('PolznakEntitiesConversation')
    profile = relationship('PolznakEntitiesProfile')


class PolznakEntitiesGrade(Base):
    __tablename__ = 'polznak_entities_grades'

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('polznak_entities_grades_id_seq'::regclass)"))
    grade = Column(Integer, nullable=False)
    conversation_id = Column(ForeignKey('polznak_entities_conversation.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)
    user_given_id = Column(ForeignKey('polznak_entities_profile.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)
    user_received_id = Column(ForeignKey('polznak_entities_profile.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)

    conversation = relationship('PolznakEntitiesConversation')
    user_given = relationship('PolznakEntitiesProfile', primaryjoin='PolznakEntitiesGrade.user_given_id == PolznakEntitiesProfile.id')
    user_received = relationship('PolznakEntitiesProfile', primaryjoin='PolznakEntitiesGrade.user_received_id == PolznakEntitiesProfile.id')


class PolznakEntitiesMessage(Base):
    __tablename__ = 'polznak_entities_message'

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('polznak_entities_message_id_seq'::regclass)"))
    body = Column(Text, nullable=False)
    send_at = Column(DateTime(True), nullable=False)
    conversation_id = Column(ForeignKey('polznak_entities_conversation.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)
    sender_id = Column(ForeignKey('polznak_entities_profile.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)

    conversation = relationship('PolznakEntitiesConversation')
    sender = relationship('PolznakEntitiesProfile')


class PolznakEntitiesMessageseenbyprofile(Base):
    __tablename__ = 'polznak_entities_messageseenbyprofile'

    id = Column(BigInteger, primary_key=True, server_default=text("nextval('polznak_entities_messageseenbyprofile_id_seq'::regclass)"))
    seen_at = Column(DateTime(True), nullable=False)
    message_id = Column(ForeignKey('polznak_entities_message.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)
    profile_id = Column(ForeignKey('polznak_entities_profile.id', deferrable=True, initially='DEFERRED'), nullable=False, index=True)

    message = relationship('PolznakEntitiesMessage')
    profile = relationship('PolznakEntitiesProfile')
